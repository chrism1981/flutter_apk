practice

页面分析：
widget这一页中：
第一级相当于整个fragment ==》 WidgetPage（）
WidgetPage 中 ==> ListView （相当于总的列表）== > CateCard(ListView里面有n个CateCard ,每个等于listView的一个一级目录子列表)

CateCard（相当于一个子列表）== > 由Text+ icon作为标题，WidgetItemContainer（自定义widget 每行3个item）为子表的item

CateCard 由一个Stack组成，分2部分： 1， list 标题 -》Text  和  WidgetItemContainer 两个部分嵌套在一个 Colunm里面 ； 2. list的icon 在stack的左上角，已Posion（）来包裹
见 _CateCardState 的 build 函数