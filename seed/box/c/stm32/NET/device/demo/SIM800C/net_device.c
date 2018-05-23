/**
	************************************************************
	************************************************************
	************************************************************
	*	文件名： 	net_device.c
	*
	*	作者： 		张继瑞
	*
	*	日期： 		2016-11-23
	*
	*	版本： 		V1.0
	*
	*	说明： 		网络设备应用层
	*
	*	修改记录：	
	************************************************************
	************************************************************
	************************************************************
**/

#include "stm32f10x.h"	//单片机头文件

#include "net_device.h"	//网络设备应用层
#include "net_io.h"		//网络设备数据IO层

//硬件驱动
#include "delay.h"
#include "led.h"
#include "usart.h"

//C库
#include <string.h>
#include <stdlib.h>
#include <stdio.h>




NET_DEVICE_INFO netDeviceInfo = {"ONENET", "IOT@Chinamobile", 0, 0, 0, 0}; //





void SIM800C_PowerCtl(void)
{
	
	RTOS_TimeDly(200);
	SIM800C_PWRK_OFF;
    RTOS_TimeDly(240);
    SIM800C_PWRK_ON;
    RTOS_TimeDly(140);

}

/*
************************************************************
*	函数名称：	NET_DEVICE_IO_Init
*
*	函数功能：	初始化网络设备IO层
*
*	入口参数：	无
*
*	返回参数：	无
*
*	说明：		初始化网络设备的控制引脚、数据收发功能等
************************************************************
*/
void NET_DEVICE_IO_Init(void)
{

	GPIO_InitTypeDef gpioInitStruct;
    
	//使能时钟
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOC, ENABLE);
    
	//PowerKey
	gpioInitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	gpioInitStruct.GPIO_Pin =  GPIO_Pin_4;
	gpioInitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOC, &gpioInitStruct);
	
	//Status
	gpioInitStruct.GPIO_Pin =  GPIO_Pin_7;
	GPIO_Init(GPIOA, &gpioInitStruct);
	
	SIM800C_PWRK_ON;
	SIM800C_PowerCtl();
	
	NET_IO_Init();											//网络设备数据IO层初始化

}

/*
************************************************************
*	函数名称：	NET_DEVICE_Init
*
*	函数功能：	网络设备初始化
*
*	入口参数：	无
*
*	返回参数：	返回初始化结果
*
*	说明：		0-成功		1-失败
************************************************************
*/
_Bool NET_DEVICE_Init(void)
{
	
	switch(netDeviceInfo.initStep)
	{
		case 0:
			
			UsartPrintf(USART_DEBUG, "AT+CSMINS?\r\n");
			if(!NET_DEVICE_SendCmd("AT+CSMINS?\r\n", "OK"))											//SIM卡是否存在
				netDeviceInfo.initStep++;
		
		break;
			
		case 1:
			
			UsartPrintf(USART_DEBUG, "AT+CIPHEAD=1\r\n");
			if(!NET_DEVICE_SendCmd("AT+CIPHEAD=1\r\n", "OK"))										//显示报文头
				netDeviceInfo.initStep++;
		
		break;
			
		case 2:
			
			UsartPrintf(USART_DEBUG, "AT+CGCLASS=\"B\"\r\n");
			if(!NET_DEVICE_SendCmd("AT+CGCLASS=\"B\"\r\n", "OK"))									//设置GPRS移动台类别为B,支持包交换和数据交换
				netDeviceInfo.initStep++;
		
		break;
			
		case 3:
			
			UsartPrintf(USART_DEBUG, "AT+CGDCONT=1,\"IP\",\"CMNET\"\r\n");
			if(!NET_DEVICE_SendCmd("AT+CGDCONT=1,\"IP\",\"CMNET\"\r\n", "OK"))						//设置PDP上下文,互联网接协议,接入点等信息
				netDeviceInfo.initStep++;
		
		break;
			
		case 4:
			
			UsartPrintf(USART_DEBUG, "AT+CGATT=1\r\n");
			if(!NET_DEVICE_SendCmd("AT+CGATT=1\r\n", "OK"))											//附着GPRS业务
				netDeviceInfo.initStep++;
		
		break;
			
		case 5:
			
			UsartPrintf(USART_DEBUG, "AT+CIPCSGP=1,\"CMNET\"\r\n");
			if(!NET_DEVICE_SendCmd("AT+CIPCSGP=1,\"CMNET\"\r\n", "OK"))								//设置为GPRS连接模式
				netDeviceInfo.initStep++;
		
		break;
			
		case 6:
			
			RTOS_TimeDly(200);
			UsartPrintf(USART_DEBUG, "AT+CIPSTART=\"TCP\",\"183.230.40.39\",876\r\n");
			if(!NET_DEVICE_SendCmd("AT+CIPSTART=\"TCP\",\"183.230.40.39\",876\r\n", "CONNECT"))		//连接平台
				netDeviceInfo.initStep++;
		
		break;
			
		default:
			break;
	}
    
	if(netDeviceInfo.initStep == 7)
		return 0;
	else
		return 1;

}

/*
************************************************************
*	函数名称：	NET_DEVICE_Reset
*
*	函数功能：	网络设备复位
*
*	入口参数：	无
*
*	返回参数：	无
*
*	说明：		
************************************************************
*/
void NET_DEVICE_Reset(void)
{
	


}

/*
************************************************************
*	函数名称：	NET_DEVICE_ReLink
*
*	函数功能：	重连平台
*
*	入口参数：	无
*
*	返回参数：	返回连接结果
*
*	说明：		0-成功		1-失败
************************************************************
*/
_Bool NET_DEVICE_ReLink(void)
{
	
	_Bool status = 0;
	
	NET_DEVICE_SendCmd("AT+CIPCLOSE=1\r\n", "CLOSE OK");										//关闭连接
	RTOS_TimeDly(100);
	
	UsartPrintf(USART_DEBUG, "AT+CIPSTART=\"TCP\",\"183.230.40.39\",876\r\n");
	status = NET_DEVICE_SendCmd("AT+CIPSTART=\"TCP\",\"183.230.40.39\",876\r\n", "CONNECT");	//连接平台
	
	return status;

}

/*
************************************************************
*	函数名称：	NET_DEVICE_SendCmd
*
*	函数功能：	向网络设备发送一条命令，并等待正确的响应
*
*	入口参数：	cmd：需要发送的命令		res：需要检索的响应
*
*	返回参数：	返回连接结果
*
*	说明：		0-成功		1-失败
************************************************************
*/
_Bool NET_DEVICE_SendCmd(char *cmd, char *res)
{
	
	unsigned char timeOut = 200;
	
	NET_IO_Send((unsigned char *)cmd, strlen((const char *)cmd));	//写命令到网络设备
	
	while(timeOut--)												//等待
	{
		if(NET_IO_WaitRecive() == REV_OK)							//如果收到数据
		{
			if(strstr((const char *)netIOInfo.buf, res) != NULL)	//如果检索到关键词
			{
				NET_IO_ClearRecive();								//清空缓存
				
				return 0;
			}
		}
		
		RTOS_TimeDly(2);											//挂起等待
	}
	
	return 1;

}

/*
************************************************************
*	函数名称：	NET_DEVICE_SendData
*
*	函数功能：	使网络设备发送数据到平台
*
*	入口参数：	data：需要发送的数据
*				len：数据长度
*
*	返回参数：	无
*
*	说明：		
************************************************************
*/
void NET_DEVICE_SendData(unsigned char *data, unsigned short len)
{

	char cmdBuf[30];

	RTOS_TimeDly(10);								//等待一下
	
	NET_IO_ClearRecive();							//清空接收缓存
	sprintf(cmdBuf, "AT+CIPSEND=%d\r\n", len);		//发送命令
	if(!NET_DEVICE_SendCmd(cmdBuf, ">"))			//收到‘>’时可以发送数据
	{
		NET_IO_Send(data, len);  					//发送设备连接请求数据
	}

}

/*
************************************************************
*	函数名称：	NET_DEVICE_GetIPD
*
*	函数功能：	获取平台返回的数据
*
*	入口参数：	等待的时间(乘以10ms)
*
*	返回参数：	平台返回的原始数据
*
*	说明：		不同网络设备返回的格式不同，需要去调试
				如ESP8266的返回格式为	"+IPD,x:yyy"	x代表数据长度，yyy是数据内容
************************************************************
*/
unsigned char *NET_DEVICE_GetIPD(unsigned short timeOut)
{

	unsigned char byte = 0, count = 0;
	char sByte[5];
	char *ptrIPD;
	
	do
	{
		if(NET_IO_WaitRecive() == REV_OK)								//如果接收完成
		{
			ptrIPD = strstr((char *)netIOInfo.buf, "IPD,");				//搜索“IPD”头
			if(ptrIPD == NULL)											//如果没找到，可能是IPD头的延迟，还是需要等待一会，但不会超过设定的时间
			{
				//UsartPrintf(USART_DEBUG, "\"IPD\" not found\r\n");
			}
			else
			{
				ptrIPD = strstr(ptrIPD, ",");ptrIPD++;					//找到','  ，然后偏移到下一个字符，代表数据长度的第一个数字
				
				while(*ptrIPD != ':')									//在','和':' 之间的都是数据长度的数据
				{
					sByte[count++] = *ptrIPD++;
				}
				byte = (unsigned char)atoi(sByte);						//将字符转为数值形式
				
				ptrIPD++;												//此时ptrIPD指针还指向':'，所以需要偏移到下个数据
				for(count = 0; count < byte; count++)					//复制数据
				{
					netIOInfo.buf[count] = *ptrIPD++;
				}
				memset(netIOInfo.buf + byte,
						0, sizeof(netIOInfo.buf) - byte);				//将后边的数据清空
				return netIOInfo.buf;									//复制完成，返回数据指针
			}
		}
		
		RTOS_TimeDly(2);												//延时等待
	} while(timeOut--);
	
	return NULL;														//超时还未找到，返回空指针

}

/*
************************************************************
*	函数名称：	NET_DEVICE_ClrData
*
*	函数功能：	清空网络设备数据接收缓存
*
*	入口参数：	无
*
*	返回参数：	无
*
*	说明：		
************************************************************
*/
void NET_DEVICE_ClrData(void)
{

	NET_IO_ClearRecive();	//清空缓存

}

/*
************************************************************
*	函数名称：	NET_DEVICE_Check
*
*	函数功能：	检查网络设备连接状态
*
*	入口参数：	无
*
*	返回参数：	返回状态
*
*	说明：		
************************************************************
*/
unsigned char NET_DEVICE_Check(void)
{
	
	unsigned char status = 0;
	
	
	return status;

}

/*
************************************************************
*	函数名称：	NET_DEVICE_ReConfig
*
*	函数功能：	设备网络设备初始化的步骤
*
*	入口参数：	步骤值
*
*	返回参数：	无
*
*	说明：		该函数设置的参数在网络设备初始化里边用到
************************************************************
*/
void NET_DEVICE_ReConfig(unsigned char step)
{

	netDeviceInfo.initStep = step;

}

/*
************************************************************
*	函数名称：	NET_DEVICE_Set_DataMode
*
*	函数功能：	设置设备数据收发模式
*
*	入口参数：	模式
*
*	返回参数：	无
*
*	说明：		
************************************************************
*/
void NET_DEVICE_Set_DataMode(unsigned char mode)
{

	netDeviceInfo.dataType = mode;

}

/*
************************************************************
*	函数名称：	NET_DEVICE_Get_DataMode
*
*	函数功能：	获取设备数据收发模式
*
*	入口参数：	无
*
*	返回参数：	模式
*
*	说明：		
************************************************************
*/
unsigned char NET_DEVICE_Get_DataMode(void)
{

	return netDeviceInfo.dataType;

}

