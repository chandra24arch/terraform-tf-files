resource "local_file" "testtfmfile" {
  filename = "firsttfm.txt"
  content  = "adding content to tfm file"
}

resource "local_file" "testtfmfile2" {
  filename = "secondtfm.txt"
  content  = "adding content to new tfm file2"
}

resource "local_file" "testtfmfile3" {
  filename = "thirttfm.txt"
  content  = "adding++ content to new tfm file3"

}

