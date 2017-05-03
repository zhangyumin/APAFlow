library(shinydashboard)

# 加载script文件夹内所有R脚本
lapply(list.files("script/", pattern = "[.][rR]$", recursive = TRUE, full.names = TRUE), source)

function(input, output, session) {
  observeEvent(input$submit, {
    output$text <- renderText({
      paste("file size is:", input$parse_gff_file['size'],"<br>add 3utr is:", input$add3utr, "<br>expand 3utr is:", input$expand3utr, "<br>pm is:", input$pm);
    });
    a = input$add3utr
    b = input$expand3utr
    output$td <- renderText({
      mathops(a,b)
    })
  })
}