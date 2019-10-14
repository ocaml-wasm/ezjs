open Js_types
open Promise

class type storageChange = object
  method oldValue : 'a prop
  method newValue : 'a prop
end

class type storageArea = object
  method get : js_string t opt -> 'a t promise t meth
  method get_arr : js_string t js_array t opt -> 'a t promise t meth
  method get_o : 'a t opt -> 'a t promise t meth
  method getBytesInUse : js_string t opt -> int promise t meth
  method getBytesInUse_arr : js_string t js_array t opt -> int promise t meth
  method set : 'b t -> unit promise t meth
  method remove : js_string t -> unit promise t meth
  method clear : unit promise t meth
end

class type storage = object
  method sync : storageArea t prop
  method local : storageArea t prop
  method managed : storageArea t prop
end

let storage : storage t = variable "browser.storage"
let local = storage##.local
let sync = storage##.sync
let managed = storage##.managed
