#include "startup.h"
#include "vga.h"
#include "Keyboard/ps2Keyboard.h"

// Demo 1 : display ZX Spectrum screenshot
#include "demo/bubblebobble.h"

// Demo 2 : text terminal

// Demo 3 : Draw
#include "demo/demo.h"

// Demo 4 : Xonix game
#include "game/Platform.h"

static int previousDemo = -1;
static int currentDemo = 4;

void showSinclairScreenshot(const char *screenshot);

void initialize()
{
}

void setup()
{
    __HAL_RCC_GPIOC_CLK_ENABLE();
    GPIO_InitTypeDef gpioInit;
    gpioInit.Pin = GPIO_PIN_13;
    gpioInit.Mode = GPIO_MODE_OUTPUT_PP;
    gpioInit.Pull = GPIO_PULLUP;
    gpioInit.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(GPIOC, &gpioInit);

    HAL_SuspendTick();
    Vga::BitmapMode = MODE_SINCLAIR;
    Vga::InitVga(Vga::timing_640x480_60hz);
    Vga::clear_screen(0x3F10);

    // Initialize PS2 Keyboard
    Ps2_Initialize();
}

void loop()
{
    bool demoInit;

    int32_t scanCode = Ps2_GetScancode();
    if (scanCode == 0)
    {
    	return;
    }

	switch (scanCode)
	{
	case KEY_F1:
		currentDemo = 1;
		break;
	case KEY_F2:
		currentDemo = 2;
		break;
	case KEY_F3:
		currentDemo = 3;
		break;
	case KEY_F4:
		currentDemo = 4;
		break;
	}

    demoInit = (currentDemo != previousDemo);
    previousDemo = currentDemo;

    switch (currentDemo)
    {
    case 1:
        if (demoInit)
        {
            Vga::hideCursor();
            showSinclairScreenshot(bubblebobble);
        }
        break;
    case 2:
        if (demoInit)
        {
            Vga::clear_screen(0xFF40);

            Vga::setCursorPosition(0, 17);
            for (uint8_t charCode = 32; charCode < 255; charCode++)
            {
                Vga::print(charCode, 0xFF40);
            }

            Vga::setCursorPosition(0, 0);
            Vga::showCursor();
        }
        else
        {
        	/*
            if (len == 1)
            {
                Vga::print(buffer[0], 0x3F10);
            }

            if (len == 3 && buffer[0] == '\e' && buffer[1] == '[')
            {
                switch (buffer[2])
                {
                case 'D':
                    if (Vga::cursor_x > 0)
                    {
                        Vga::setCursorPosition(Vga::cursor_x - 1, Vga::cursor_y);
                    }
                    break;
                case 'C':
                    if (Vga::cursor_x < Vga::hres() - 1)
                    {
                        Vga::setCursorPosition(Vga::cursor_x + 1, Vga::cursor_y);
                    }
                    break;
                case 'A':
                    if (Vga::cursor_y > 0)
                    {
                        Vga::setCursorPosition(Vga::cursor_x, Vga::cursor_y - 1);
                    }
                    break;
                case 'B':
                    if (Vga::cursor_y < Vga::vres() - 1)
                    {
                        Vga::setCursorPosition(Vga::cursor_x, Vga::cursor_y + 1);
                    }
                    break;
                }
            }
            */
        }
        break;
    case 3:
        if (demoInit)
        {
            Vga::hideCursor();
            VgaDemo::DemoSetup();
        }
        else
        {
            VgaDemo::DemoLoop();
        }
        break;
    case 4:
        if (demoInit)
        {
            Vga::hideCursor();
            Vga::clear_screen(0x3000);

            GameInit();
        }
        else
        {
            GameUpdate();
        }
        break;
    }
}

void showSinclairScreenshot(const char *screenshot)
{
    memcpy((void *)Vga::VideoMemoryPixels, screenshot, BITMAP_SIZE);
    for (uint32_t i = 0; i < COLORS_SIZE; i++)
    {
        Vga::VideoMemoryColors[i] = Vga::ConvertSinclairColor(screenshot[BITMAP_SIZE + i]);
    }
}
