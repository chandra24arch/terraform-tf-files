resource "local_file" "resource1"{
  filename= "fl1"
  content= var.numbervar

}

resource "local_file" "resource2"{
  filename= "fl2"
  content= var.stringvar

}

resource "local_file" "resource3"{
  filename= "fl3"
  content= var.boolvar

}

resource "local_file" "resource4"{
  filename= "fl4"
  content= var.anyvar

}


resource "local_file" "resource5"{
  filename= "fl5"
  content= var.listvar[0]

}

resource "local_file" "resource6"{
  filename= "fl6"
  content= var.listvar1[1]

}
resource "local_file" "resource7"{
  filename= "fl7"
  content= var.mapvar.id

}
resource "local_file" "resource8"{
  filename= "fl8"
  content= var.tuplevar[1]

}
resource "local_file" "resource9"{
  filename= "fl9"
  content= var.objvar.id
}

resource "local_file" "resource10"{
  filename= "fl10"
  content= var.comobj.address[0].address2
}
