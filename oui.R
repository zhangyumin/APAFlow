library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('预处理', tabName = 'preprocessing', icon = icon('random'),
        menuSubItem('GFF格式化', tabName = 'parse_gff'),
        menuSubItem('SAM文件转换为PA坐标', tabName = 'sam2pat'),
        menuSubItem('去除internal priming', tabName = 'remove_ip'),
        menuSubItem('聚类PAT', tabName = 'pat2pac'),
        menuSubItem('统计PAC', tabName = 'stat_pac'),
        menuSubItem('过滤', tabName = 'filter_pac'),
        menuSubItem('标准化', tabName = 'normalize_pac'),
        menuSubItem('PAC诊断', tabName = 'diagnose_pac')
    ),
    menuItem('PAS分析', tabName = 'pas_analysis', icon = icon('line-chart'),
        menuSubItem('提取序列', tabName = 'trim_seq'),
        menuSubItem('单核苷分布', tabName = 'single_nucleotide'),
        menuSubItem('联子分析', tabName = 'kcount'),
        menuSubItem('信号分析', tabName = 'signal_analysis')
    ),
    menuItem('PAC分析', tabName = 'pac_analysis', icon = icon('bar-chart'),
        menuSubItem('分类PAC', tabName = 'classify_pac'),
        menuSubItem('DE PAC', tabName = 'de_pac'),
        menuSubItem('APA Switching', tabName = 'apa_switching'),
        menuSubItem('3UTR长度', tabName = '3utr_length')
    ),
    menuItem('功能分析', tabName = 'functional_analysis', icon = icon('google'),
        menuSubItem('go PAC', tabName = 'go_pac')
    )
  )
)

body <- dashboardBody(
  tabItems(
    # 第一部分：预处理
    tabItem(tabName = "parse_gff",
      fluidRow(
        box(
          width = 4, status = "info", solidHeader = TRUE,
          title = "Options",
          fileInput("parse_gff_file", "Input file here", multiple = FALSE, accept = NULL, width = NULL),
          numericInput("add3utr", "add3utr", 0),
          numericInput("expand3utr", "expand3utr", 0),
          numericInput("pm", "pm", 0),
          actionButton("submit","submit")
        ),
        box(
          width = 8, status = "info", solidHeader = TRUE,
          title = "Results",
          htmlOutput("text"),
          htmlOutput("td")
        )
      )
    ),
    tabItem(tabName = "sam2pat",
      fluidRow(
        box(
          width = 4, status = "info", solidHeader = TRUE,
          title = "Options",
          selectInput("Poly type", "poly", c("A" = "A","T" = "T")),
          numericInput("m", "m", 0),
          numericInput("s", "s", 0)
        ),
        box(
          width = 8, status = "info", solidHeader = TRUE,
          title = "Results"
        )
      )
    ),
    tabItem(tabName = "remove_ip",
            h2("去除internal priming")
    ),
    tabItem(tabName = "pat2pac",
      fluidRow(
        box(
          width = 4, status = "info", solidHeader = TRUE,
          title = "Options",
          selectInput("big_mem", "big mem", c("A" = "A","T" = "T")),
          numericInput("distance", "distance", 24),
          selectInput("anti", "anti", c("A" = "A","T" = "T"))
        ),
        box(
          width = 8, status = "info", solidHeader = TRUE,
          title = "Results"
        )
      )
    ),
    tabItem(tabName = "stat_pac",
            h2("统计pac")
    ),
    tabItem(tabName = "filter_pac",
      fluidRow(
        box(
          width = 4, status = "info", solidHeader = TRUE,
          title = "Options",
          numericInput("pass_pat", "passPAT", 50),
          numericInput("tot", "tot", 9),
          numericInput("apat", "apat", 3),
          numericInput("g_ratio", "g ratio", 0.2),
          numericInput("nsmp", "nsmp", 6),
          numericInput("gs_ratio", "gs ratio", 0.05),
          selectInput("big_mem", "big mem", c("A" = "A","T" = "T")),
          numericInput("distance", "distance", 24),
          selectInput("anti", "anti", c("A" = "A","T" = "T"))
        ),
        box(
          width = 8, status = "info", solidHeader = TRUE,
          title = "Results"
        )
      )
    ),
    tabItem(tabName = "normalize_pac",
            h2("标准化")
    ),
    tabItem(tabName = "diagnose_pac",
            h2("PAC诊断")
    ),
    
    # 第二部分：PAS分析
    tabItem(tabName = "trim_seq",
            h2("提取序列")
    ),
    tabItem(tabName = "single_nucleotide",
      fluidRow(
        box(
          width = 4, status = "info", solidHeader = TRUE,
          title = "Options",
          numericInput("from", "from", 1),
          numericInput("to", "to", 400),
          numericInput("k", "k", 1),
          selectInput("sort", "sort", c("False" = "F","True" = "T")),
          selectInput("cnt", "cnt", c("False" = "F","True" = "T")),
          selectInput("freq", "freq", c("A" = "A","T" = "T"))
        ),
        box(
          width = 8, status = "info", solidHeader = TRUE,
          title = "Results"
        )
      )
    ),
    tabItem(tabName = "kcount",
      fluidRow(
        box(
          width = 4, status = "info", solidHeader = TRUE,
          title = "Options",
          numericInput("k", "k", 1),
          numericInput("from", "from", 1),
          numericInput("to", "to", 400),
          selectInput("sort", "sort", c("False" = "F","True" = "T")),
          numericInput("topn", "top n", 50),
          numericInput("grap_once", "grap once", -1)
        ),
        box(
          width = 8, status = "info", solidHeader = TRUE,
          title = "Results"
        )
      )
    ),
    tabItem(tabName = "signal_analysis",
            h2("信号分析")
    ),
    
    #第三部分：PAC分析
    tabItem(tabName = "classify_pac",
      fluidRow(
        box(
          width = 4, status = "info", solidHeader = TRUE,
          title = "Options",
          numericInput("sexpr", "sexpr", 100)
        ),
        box(
          width = 8, status = "info", solidHeader = TRUE,
          title = "Results"
        )
      )
    ),
    tabItem(tabName = "de_pac",
            h2("DE PAC")
    ),
    tabItem(tabName = "apa_switching",
      fluidRow(
        box(
          width = 4, status = "info", solidHeader = TRUE,
          title = "Options",
          selectInput("method", "method", c("3UTR" = "3utr", "Non 3UTR" = "non-3utr")),
          selectInput("ogene", "ogene", c("T" = "T")),
          numericInput("avgPAT", "avgPAT", 5),
          selectInput("suffix", "suffix", c("all" = "all"))
        ),
        box(
          width = 8, status = "info", solidHeader = TRUE,
          title = "Results"
        )
      )
    ),
    tabItem(tabName = "3utr_length",
            h2("3utr_length")
    ),
    
    #第四部分：goPAC
    tabItem(tabName = "go_pac",
            h2("goPAC")
    )
  )
  
)

dashboardPage(
  skin = "blue",
  dashboardHeader(title = "APAFlow"),
  sidebar,
  body
)