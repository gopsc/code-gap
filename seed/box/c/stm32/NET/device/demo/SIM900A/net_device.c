#include "net_device.h"
#include "net_io.h"

#include "delay.h"
#include "led.h"
#include "usart.h"

#include "stm32f4xx.h"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>




NET_DEVICE_INFO netDeviceInfo = {"Jason-Wifi", "JasonZhang888", 0, 0, 0, 0, 0}; //netWork ssid pswd 保留


void NET_DEVICE_PowerKey(void)
{

	RTOS_TimeDly(100);
	NET_DEVICE_PWRK_OFF;
	RTOS_TimeDly(210);
	NET_DEVICE_PWRK_ON;
	RTOS_TimeDly(100);

}

void NET_DEVICE_IO_Init(void)
{

	//复位
	GPIO_InitTypeDef gpioInitStruct;
	
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);
	
	gpioInitStruct.GPIO_Mode = GPIO_Mode_OUT;
	gpioInitStruct.GPIO_OType = GPIO_OType_PP;
	gpioInitStruct.GPIO_Pin = GPIO_Pin_5 | GPIO_Pin_6;
	gpioInitStruct.GPIO_PuPd = GPIO_PuPd_UP;
	gpioInitStruct.GPIO_Speed = GPIO_Speed_100MHz;
	
	GPIO_Init(GPIOF, &gpioInitStruct);
	
	NET_DEVICE_PWRK_ON;
	
	NET_IO_Init();

}

/***************************************************************************************

							以下是网络设备层需要提供的功能

****************************************************************************************/

//模式初始化
_Bool NET_DEVICE_Init(void)
{

	switch(netDeviceInfo.initStep)
	{
		case 0:
			
			Led1_Set(LED_ON);
			Usart_Printf(USART_DEBUG, "Tips:	AT+CPIN?\r\n");
			if(!NET_DEVICE_SendCmd("AT+CPIN?\r\n", "READY"))
				netDeviceInfo.initStep++;
		
		break;
			
		case 1:
			
			Usart_Printf(USART_DEBUG, "Tips:	AT+CIPHEAD=1\r\n");
			if(!NET_DEVICE_SendCmd("AT+CIPHEAD=1\r\n", "OK"))
				netDeviceInfo.initStep++;
		
		break;
			
		case 2:
			
			Usart_Printf(USART_DEBUG, "Tips:	AT+CGCLASS=\"B\"\r\n");
			if(!NET_DEVICE_SendCmd("AT+CGCLASS=\"B\"\r\n", "OK"))
				netDeviceInfo.initStep++;
		
		break;
		
		case 3:
			
			Usart_Printf(USART_DEBUG, "Tips:	AT+CGDCONT=1,\"IP\",\"CMNET\"\r\n");
			if(!NET_DEVICE_SendCmd("AT+CGDCONT=1,\"IP\",\"CMNET\"\r\n", "OK"))
				netDeviceInfo.initStep++;
		
		break;
		
		case 4:
			
			Usart_Printf(USART_DEBUG, "Tips:	AT+CGATT=1\r\n");
			if(!NET_DEVICE_SendCmd("AT+CGATT=1\r\n", "OK"))
				netDeviceInfo.initStep++;
		
		break;
			
		case 5:
			
			Usart_Printf(USART_DEBUG, "Tips:	AT+CIPCSGP=1,\"CMNET\"\r\n");
			if(!NET_DEVICE_SendCmd("AT+CIPCSGP=1,\"CMNET\"\r\n", "OK"))
				netDeviceInfo.initStep++;
		
		break;
		
		case 6:
			
			Usart_Printf(USART_DEBUG, "Tips:	AT+CIPSTART=\"TCP\",\"183.230.40.39\",876\r\n");
			if(!NET_DEVICE_SendCmd("AT+CIPSTART=\"TCP\",\"183.230.40.39\",876\r\n", "CONNECT")) //"OK"
				netDeviceInfo.initStep++;
		
		break;
		
		default:
			
		break;
	}
	
	if(netDeviceInfo.initStep == 7)
	{
		Led1_Set(LED_OFF);
		return 0;
	}
	else
		return 1;

}

//复位
void NET_DEVICE_Reset(void)
{

	Usart_Printf(USART_DEBUG, "Tips:	SIM900_Reset\r\n");
	
	NET_DEVICE_RST_ON;
	RTOS_TimeDly(50); //时间要足够 随便写的值，不一定是最小有效时间
	
	NET_DEVICE_RST_OFF;
	RTOS_TimeDly(200); //时间要足够 随便写的值，不一定是最小有效时间

}

//重连
_Bool NET_DEVICE_ReLink(void)
{
	
	_Bool status = 0;
	
	NET_DEVICE_SendCmd("AT+CIPCLOSE\r\n", "OK");
	Usart_Printf(USART_DEBUG, "Tips:	CIPCLOSE\r\n");
	RTOS_TimeDly(100);
	
	Usart_Printf(USART_DEBUG, "ReLink Tips:	AT+CIPSTART=\"TCP\",\"183.230.40.39\",876\r\n");
	
	status = NET_DEVICE_SendCmd("AT+CIPSTART=\"TCP\",\"183.230.40.39\",876\r\n", "CONNECT");
	
	return status;

}

//发送命令
_Bool NET_DEVICE_SendCmd(char *cmd, char *res)
{
	
	unsigned char timeOut = 200;
	
	NET_IO_Send((unsigned char *)cmd, strlen((const char *)cmd));
	
	while(timeOut--)
	{
		if(NET_IO_WaitRecive() == REV_OK)
		{
			if(strstr((const char *)netIOInfo.buf, res) != NULL)
			{
				NET_IO_ClearRecive();
				
				return 0;
			}
		}
		
		RTOS_TimeDly(2);
	}
	
	return 1;

}

//数据发送
void NET_DEVICE_SendData(unsigned char *data, unsigned short len)
{
	
#if(NET_DEVICE_TRANS == 1)
	NET_IO_Send(data, len);  //发送设备连接请求数据
#else
	char cmdBuf[30];

	RTOS_TimeDly(10);
	
	NET_IO_ClearRecive();
	sprintf(cmdBuf, "AT+CIPSEND=%d\r\n", len);
	if(!NET_DEVICE_SendCmd(cmdBuf, ">"))
	{
		NET_IO_Send(data, len);  //发送设备连接请求数据
	}
#endif

}

//把IPD的内容复制到串口buffer里边
unsigned char *NET_DEVICE_GetIPD(unsigned short timeOut)
{

	unsigned char byte = 0, count = 0;
	char sByte[5];
	char *ptrIPD;
	
	do
	{
		if(NET_IO_WaitRecive() == REV_OK)
		{
			ptrIPD = strstr((char *)netIOInfo.buf, "IPD,");
			if(ptrIPD == NULL)
			{
				//UsartPrintf(USART_DEBUG, "\"IPD\" not found\r\n");
			}
			else
			{
				ptrIPD = strstr(ptrIPD, ",");ptrIPD++;
				
				while(*ptrIPD != ':')
				{
					sByte[count++] = *ptrIPD++;
				}
				byte = (unsigned char)atoi(sByte);
				
				ptrIPD++;
				for(count = 0; count < byte; count++)
				{
					netIOInfo.buf[count] = *ptrIPD++;
				}
				memset(netIOInfo.buf + byte,
						0, sizeof(netIOInfo.buf) - byte);				//将后边的数据清空
				return netIOInfo.buf;
			}
		}
		
		RTOS_TimeDly(2);
	} while(timeOut--);
	
	return NULL;

}

void NET_DEVICE_ClrData(void)
{

	NET_IO_ClearRecive();

}

//状态检查
unsigned char NET_DEVICE_Check(void)
{
	
	unsigned char status = 0;
	unsigned char timeOut = 200;

	NET_IO_ClearRecive();
	NET_IO_Send((unsigned char *)"AT+CIPSTATUS\r\n",  14);
	
	while(--timeOut)
	{
		if(NET_IO_WaitRecive() == REV_OK)
		{
			
			
			break;
		}
		
		RTOS_TimeDly(2);
	}
	
	if(timeOut == 0)
	{
		status = 3;
		Usart_Printf(USART_DEBUG, "Check TimeOut\r\n");
	}
	
	return status;

}

void NET_DEVICE_ReConfig(unsigned char step)
{

	netDeviceInfo.initStep = step;

}

void NET_DEVICE_Set_DataMode(unsigned char mode)
{

	netDeviceInfo.dataType = mode;

}

unsigned char NET_DEVICE_Get_DataMode(void)
{

	return netDeviceInfo.dataType;

}

