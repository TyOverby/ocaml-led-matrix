module Canvas : sig
  type t

  val set_pixel : t -> x:int -> y:int -> r:int -> g:int -> b:int -> unit
end

module Matrix : sig
  type t

  val create : rows:int -> chained:int -> parallel:int -> t
  val current_canvas : t -> Canvas.t
  val offscreen_canvas : t -> Canvas.t
  val swap_canvas : t -> Canvas.t -> Canvas.t
end
