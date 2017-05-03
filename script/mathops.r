mathops <- function(a, b, upload_file) {
  file_data = read.table(upload_file)
  line1 = file_data[1, 1]
  line2 = file_data[2, 1]
  result = line1 * a + line2 * b
  write.table(result, file = upload_file,append = TRUE, quote = FALSE, row.names = FALSE, col.names = FALSE)
  return(result)
}