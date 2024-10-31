resource "local_file" "foreach" {
				filename = each.value
				for_each = toset(var.filename)
				content = "looping"
			}
			variable filename {
				type = list(string)
				default = ["aaa","bbb", "aaa"]
			}

resource local_file f4 {
			        filename = var.filename1[count.index]
				count=length(var.filename1)
				content  = "loop"
}

			variable filename1 {
				type = list(string)
				default = ["aa","bb", "aa"]
			}
