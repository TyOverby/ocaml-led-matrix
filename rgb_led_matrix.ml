module Canvas = struct
  type t = Decls.canvas_ptr

  let set_pixel t ~x ~y ~r ~g ~b =
    let r = Unsigned.UInt8.of_int r in
    let g = Unsigned.UInt8.of_int g in
    let b = Unsigned.UInt8.of_int b in
    Decls.led_canvas_set_pixel t x y r g b
  ;;
end

module Matrix = struct
  type t = Decls.rgb_led_matrix_ptr

  let create ~rows ~chained ~parallel = Decls.led_matrix_create rows chained parallel
  let current_canvas = Decls.led_matrix_get_canvas
  let offscreen_canvas = Decls.led_matrix_create_offscreen_canvas
  let swap_canvas = Decls.led_matrix_swap_on_vsync
end
