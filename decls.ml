open Ctypes
open Foreign

type rgb_led_matrix
type led_canvas
type rgb_led_matrix_ptr = rgb_led_matrix structure ptr
type canvas_ptr = led_canvas structure ptr

let rgb_led_matrix : rgb_led_matrix structure typ = structure "rgb_led_matrix"
let led_canvas : led_canvas structure typ = structure "led_canvas"

let led_matrix_create =
  foreign "led_matrix_create" (int @-> int @-> int @-> returning (ptr rgb_led_matrix))
;;

let led_matrix_delete =
  foreign "led_matrix_delete" (ptr rgb_led_matrix @-> returning void)
;;

let led_matrix_get_canvas =
  foreign "led_matrix_get_canvas" (ptr rgb_led_matrix @-> returning (ptr led_canvas))
;;

let led_canvas_set_pixel =
  foreign
    "led_canvas_set_pixel"
    (ptr led_canvas
    @-> int
    @-> int
    @-> uint8_t
    @-> uint8_t
    @-> uint8_t
    @-> returning void)
;;

let led_matrix_create_offscreen_canvas =
  foreign
    "led_matrix_create_offscreen_canvas"
    (ptr rgb_led_matrix @-> returning (ptr led_canvas))
;;

let led_matrix_swap_on_vsync =
  foreign
    "led_matrix_swap_on_vsync"
    (ptr rgb_led_matrix @-> ptr led_canvas @-> returning (ptr led_canvas))
;;
