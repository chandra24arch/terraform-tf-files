resource local_file res1 {
				
				filename = "indipendent resouce1"

			        content = "this is independent resource 1"
lifecycle{			 
create_before_destroy = true
			 }
}

resource local_file res2 {
				filename = local_file.res1.id
				content = "this is dependent resource2"
		         	

   			 
			 }
				
resource local_file res3 {
				filename = "explicit dependent resource3"
				content = "this is explicit dependent resource3 created after res 4 and res 5"
				depends_on = [local_file.res4, local_file.res5]
			 }

resource local_file res4 {
				filename = local_file.res2.filename
				content = "this is resorce 4"
			 
			}

resource local_file res5 {
				filename = "resource5"
				content = "this is independent res 5"


lifecycle{
prevent_destroy =false 
}
}


