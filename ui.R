library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('预处理', tabName = 'preprocessing', icon = icon('line-chart'),
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
    menuItem('PAC分析', tabName = 'pac_analysis', icon = icon('line-chart'),
        menuSubItem('分类PAC', tabName = 'classify_pac'),
        menuSubItem('DE PAC', tabName = 'de_pac'),
        menuSubItem('APA Switching', tabName = 'apa_switching'),
        menuSubItem('3UTR长度', tabName = '3utr_length')
    ),
    menuItem('功能分析', tabName = 'functional_analysis', icon = icon('line-chart'),
        menuSubItem('go PAC', tabName = 'go_pac')
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "parse_gff",
            h2("parse_gff")
    ),
    
    tabItem(tabName = "trim_seq",
            h2("trim_seq")
    )
  )
)

dashboardPage(
  skin = "blue",
  dashboardHeader(title = "APAFlow"),
  sidebar,
  body
)