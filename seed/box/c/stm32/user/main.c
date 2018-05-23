/**
	************************************************************
	************************************************************
	************************************************************
	*	文件名： 	main.c
	*
	*	作者： 		张继瑞
	*
	*	日期： 		2017-01-011
	*
	*	版本： 		V1.0
	*
	*	说明： 		接入onenet，上传数据和命令控制
	*
	*	修改记录：	
	************************************************************
	************************************************************
	************************************************************
**/

//单片机头文件
#include "stm32f10x.h"

//网络协议层
#include "onenet.h"
#include "fault.h"

//网络设备
#include "net_device.h"

//硬件驱动
#include "led.h"
#include "delay.h"
#include "usart.h"
#include "hwtimer.h"
#include "i2c.h"
#include "sht20.h"
#include "at24c02.h"
#include "selfcheck.h"
#include "info.h"

//C库
#include <string.h>



//数据流
DATA_STREAM dataStream[] = {
								{"Red_Led", &ledStatus.Led5Sta, TYPE_BOOL, 1},
								{"Green_Led", &ledStatus.Led4Sta, TYPE_BOOL, 1},
								{"Yellow_Led", &ledStatus.Led3Sta, TYPE_BOOL, 1},
								{"Blue_Led", &ledStatus.Led2Sta, TYPE_BOOL, 1},
								{"temperature", &sht20Info.tempreture, TYPE_FLOAT, 1},
								{"humidity", &sht20Info.humidity, TYPE_FLOAT, 1},
								{"errType", &faultTypeReport, TYPE_UCHAR, 1},
							};
unsigned char dataStreamLen = sizeof(dataStream) / sizeof(dataStream[0]);





/*
************************************************************
*	函数名称：	Hardware_Init
*
*	函数功能：	硬件初始化
*
*	入口参数：	无
*
*	返回参数：	无
*
*	说明：		初始化单片机功能以及外接设备
************************************************************
*/
void Hardware_Init(void)
{
	
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);								//中断控制器分组设置

	Delay_Init();																//systick初始化
	
	Led_Init();																	//LED初始化
	
	IIC_Init();																	//软件IIC总线初始化
	
	Usart1_Init(115200); 														//初始化串口   115200bps
	
	Check_PowerOn(); 															//上电自检

	if(RCC_GetFlagStatus(RCC_FLAG_IWDGRST) == SET) 								//如果是看门狗复位则提示
	{
		UsartPrintf(USART_DEBUG, "WARN:	IWDG Reboot\r\n");
		
		RCC_ClearFlag();														//清除看门狗复位标志位
		
		faultTypeReport = faultType = FAULT_REBOOT; 							//标记为重启错误
	}
	else
	{
		UsartPrintf(USART_DEBUG, "2.SSID: %s,   PSWD: %s\r\n"
								"DEVID: %s,     APIKEY: %s\r\n"
								, netDeviceInfo.staName, netDeviceInfo.staPass
								, oneNetInfo.devID, oneNetInfo.apiKey);
	}
	
	//Iwdg_Init(4, 1250); 														//64分频，每秒625次，重载1250次，2s
	
	Timer3_4_Init(TIM3, 49, 35999);												//72MHz，36000分频-500us，50重载值。则中断周期为500us * 50 = 25ms
	Timer3_4_Init(TIM4, 1999, 35999);											//72MHz，36000分频-500us，2000重载值。则中断周期为500us * 2000 = 1s
																				//定时检查网络状态标志位
	
	UsartPrintf(USART_DEBUG, "3.Hardware init OK\r\n");							//提示初始化完成

}

/*
************************************************************
*	函数名称：	main
*
*	函数功能：	
*
*	入口参数：	无
*
*	返回参数：	0
*
*	说明：		
************************************************************
*/
int main(void)
{
	
	unsigned char *dataPtr;
	unsigned int runTime = 0;
	_Bool sendFlag = 0;

	Hardware_Init();									//硬件初始化
	
	NET_DEVICE_IO_Init();								//网络设备IO初始化
	NET_DEVICE_Reset();									//网络设备复位
	NET_DEVICE_Set_DataMode(DEVICE_CMD_MODE);			//设置为命令收发模式(例如ESP8266要区分AT的返回还是平台下发数据的返回)
	
	while(1)
	{
		
		if(oneNetInfo.netWork == 1)
		{
/******************************************************************************
			数据与心跳
******************************************************************************/
			if(timInfo.timer3Out - runTime >= 1000)									//25s一次(25ms中断)
			{
				runTime = timInfo.timer3Out;
				
				if(sendFlag)
				{
					TIM_Cmd(OS_TIMER, DISABLE);
					OneNet_Status();												//状态检查
					TIM_Cmd(OS_TIMER, ENABLE);
				}
				else
				{
					TIM_Cmd(OS_TIMER, DISABLE);
					OneNet_SendData(HTTP_TYPE3, dataStreamLen);		//数据发送
					TIM_Cmd(OS_TIMER, ENABLE);
				}
		
				sendFlag = !sendFlag;
			}
			
/******************************************************************************
			发送结果解析
******************************************************************************/
			if(oneNetInfo.netWork && NET_DEVICE_Get_DataMode() == DEVICE_DATA_MODE)	//当有网络 且 在命令接收模式时
			{
				dataPtr = NET_DEVICE_GetIPD(0);										//不等待，获取平台下发的数据
				if(dataPtr != NULL)													//如果数据指针不为空，则代表收到了数据
				{
					OneNet_Event(dataPtr);											//集中处理
				}
			}
			
/******************************************************************************
			传感器
******************************************************************************/
			if(checkInfo.SHT20_OK == DEV_OK) 										//只有设备存在时，才会读取值和显示
			{
				SHT20_GetValue();													//采集传感器数据
			}
			
/******************************************************************************
			错误处理
******************************************************************************/
			if(faultType != FAULT_NONE)												//如果错误标志被设置
			{
				UsartPrintf(USART_DEBUG, "WARN:	Fault Process\r\n");
				Fault_Process();													//进入错误处理函数
			}
			
/******************************************************************************
			数据反馈
******************************************************************************/
			if(oneNetInfo.sendData)
			{
				oneNetInfo.sendData = OneNet_SendData(HTTP_TYPE3, dataStreamLen);
			}
		}
		else
		{
/******************************************************************************
			初始化网络设备、接入平台
******************************************************************************/
			if(!oneNetInfo.netWork && (checkInfo.NET_DEVICE_OK == DEV_OK))			//当没有网络 且 网络模块检测到时
			{
				NET_DEVICE_Set_DataMode(DEVICE_CMD_MODE);							//设置为命令收发模式
				
				if(!NET_DEVICE_Init())												//初始化网络设备，能连入网络
				{
					oneNetInfo.netWork = 1;
					runTime = timInfo.timer3Out;									//更新时间
					NET_DEVICE_Set_DataMode(DEVICE_DATA_MODE);
					UsartPrintf(USART_DEBUG, "Tips:	NetWork OK\r\n");
				}
			}
			
/******************************************************************************
			网络设备检测
******************************************************************************/
			if(checkInfo.NET_DEVICE_OK == DEV_ERR) 									//当网络设备未做检测
			{
				NET_DEVICE_Set_DataMode(DEVICE_CMD_MODE);							//设置为命令收发模式
				
				if(timerCount >= NET_TIME) 											//如果网络连接超时
				{
					UsartPrintf(USART_DEBUG, "Tips:		Timer Check Err\r\n");
					
					NET_DEVICE_Reset();												//复位网络设备
					timerCount = 0;													//清零连接超时计数
					faultType = FAULT_NONE;											//清除错误标志
				}
				
				if(!NET_DEVICE_SendCmd("AT\r\n", "OK"))								//网络设备检测
				{
					UsartPrintf(USART_DEBUG, "NET Device :Ok\r\n");
					checkInfo.NET_DEVICE_OK = DEV_OK;								//检测到网络设备，标记
					NET_DEVICE_Set_DataMode(DEVICE_DATA_MODE);						//设置为数据收发模式
				}
				else
					UsartPrintf(USART_DEBUG, "NET Device :Error\r\n");
			}
		}
	}

}
