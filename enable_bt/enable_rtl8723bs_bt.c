// ThunderSoft
// GPL
// Ultra-simple kernel module that set a GPIO to H
//   so that bluetooth portition of RTL8723BS is enabled.

#include <linux/module.h>
#include <linux/gpio.h>
#include <linux/delay.h>
#include <linux/init.h>

MODULE_LICENSE("GPL");


static int __init enable_8723bs_bt(void) {
  int err;

  printk( "enabling 8723bt.\n");
  err = gpio_request(404, "bt_en");
  printk("gpio_request err=%d.\n", err);
  err = gpio_direction_output(404, 0); 
  mdelay(1000);
  err = gpio_direction_output(404, 1);  // FixMe: request gpio; power management, just always on for now. 
  mdelay(300);
  printk("gpio_direction_output err=%d.\n", err);
  // We shall allow some time for 8723, but host will rescan with 400,300,200,100kHz.

  return 0;
}

static void __exit cleanup_function(void)
{
  gpio_free(404);
/* Cleanup code here */
}

module_init(enable_8723bs_bt);
module_exit(cleanup_function);





