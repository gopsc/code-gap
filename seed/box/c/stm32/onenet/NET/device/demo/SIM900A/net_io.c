#include "net_io.h"

#include "delay.h"

#include <string.h>




NET_IO_INFO netIOInfo;




void NET_IO_Init(void)
{

	GPIO_InitTypeDef gpioInitStructure;
	USART_InitTypeDef usartInitStructure;
	NVIC_InitTypeDef nvicInitStructure;
	
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	
	gpioInitStructure.GPIO_Pin = GPIO_Pin_10 | GPIO_Pin_11;
	gpioInitStructure.GPIO_Mode = GPIO_Mode_AF;
	gpioInitStructure.GPIO_OType = GPIO_OType_PP;
	gpioInitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	gpioInitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	
	GPIO_Init(GPIOB, &gpioInitStructure);
	
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource11, GPIO_AF_USART3);
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource10, GPIO_AF_USART3);
	
	usartInitStructure.USART_BaudRate = 115200;
	usartInitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None; //无硬件数据流控制
	usartInitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx; //发送和接收
	usartInitStructure.USART_Parity = USART_Parity_No; //无奇偶校验
	usartInitStructure.USART_StopBits = USART_StopBits_1; //1位停止位
	usartInitStructure.USART_WordLength = USART_WordLength_8b; //8位数据长度
	
	USART_Init(USART3, &usartInitStructure);
	
	USART_Cmd(USART3, ENABLE); //使能串口
	USART_ClearFlag(USART3, USART_FLAG_TC);
	USART_ITConfig(USART3, USART_IT_RXNE, ENABLE); //开启接收中断
	
	nvicInitStructure.NVIC_IRQChannel = USART3_IRQn;
	nvicInitStructure.NVIC_IRQChannelPreemptionPriority = 1;
	nvicInitStructure.NVIC_IRQChannelSubPriority = 0;
	nvicInitStructure.NVIC_IRQChannelCmd = ENABLE;
	
	NVIC_Init(&nvicInitStructure);
	
	NET_IO_ClearRecive();

}

void NET_IO_Send(unsigned char *str, unsigned short len)
{

	unsigned short count = 0;
	
	for(; count < len; count++)
	{
		USART_SendData(NET_IO, *str++);
		while(USART_GetFlagStatus(NET_IO, USART_FLAG_TC) == RESET);
	}

}

//返回0代表ok		返回1代表未完成
_Bool NET_IO_WaitRecive(void)
{

	if(netIOInfo.dataLen == 0) //如果接收计数为0 则说明没有处于接收数据中，所以直接跳出，结束函数
		return REV_WAIT;
		
	if(netIOInfo.dataLen == netIOInfo.dataLenPre) //如果上一次的值和这次相同，则说明接收完毕
	{
		netIOInfo.dataLen = 0; //清0接收计数
			
		return REV_OK; //跳出
	}
		
	netIOInfo.dataLenPre = netIOInfo.dataLen; //置为相同
	
	return REV_WAIT;

}

void NET_IO_ClearRecive(void)
{

	netIOInfo.dataLen = 0;
	
	memset(netIOInfo.buf, 0, sizeof(netIOInfo.buf));

}

void USART3_IRQHandler(void)
{
	
	OSIntEnter();

	if(USART_GetITStatus(USART3, USART_IT_RXNE) != RESET) //接收中断
	{
		if(netIOInfo.dataLen >= sizeof(netIOInfo.buf))	netIOInfo.dataLen = 0; //防止串口被刷爆
		netIOInfo.buf[netIOInfo.dataLen++] = USART3->DR;
		
		USART_ClearFlag(USART3, USART_FLAG_RXNE);
	}
	
	OSIntExit();

}
