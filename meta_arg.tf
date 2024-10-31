

data "local_file" "test1"{
  filename="/home/chandra/terraform_dir/terraform_files/meta_file_content.properties"
}

resource "local_file" "t1"{
  filename="using_meta_arguments"
  content= data.local_file.test1.content

}

output "op1"{
  value = data.local_file.test1.filename

}

