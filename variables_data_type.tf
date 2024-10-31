variable "numbervar" {
  default = 5
  type = number
}

variable "stringvar"{
  default = "terraform"
  type = string
}

variable "boolvar"{
  default = "true"
  type = bool
}

variable "anyvar"{
  default = "a5.txt"
  type = any

}

variable "listvar"{
  default = ["string", 246 , true ]
  type = any

}
variable "listvar1"{
  default = ["chandra","shekar"]
  type = list(string)

}

variable "mapvar"{
  type = map(string)
  default = {
    name = "chandra"
    id="246"
    phonenum= "8660"

}
}
variable "tuplevar"{
  type = tuple([string, number, list(any)])
  default=["chandra", 24, ["a",6]]
}

variable "objvar" {
  type= object({
   id  = number
  name= string
  address = list(string)
})

default = {
  id = 4
  name= "kvchandra"
  address = ["cityA","cityB"]
  
}
}
variable comobj{
type =object ({

id = number
name= string
address = list(map(string))
})

default ={

id=1
name= "kv"
address=[{address1="cityA",address2="city2"}]
}
}
