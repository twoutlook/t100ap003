#該程式未解開Section, 採用最新樣板產出!
{<section id="astq330.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0018(2016-09-14 09:52:25), PR版次:0018(2016-09-14 09:30:46)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000116
#+ Filename...: astq330
#+ Description: 供應商結算底稿查詢
#+ Creator....: 03247(2014-11-20 17:14:18)
#+ Modifier...: 08742 -SD/PR- 08742
 
{</section>}
 
{<section id="astq330.global" >}
#應用 i02 樣板自動產生(Version:38)
#add-point:填寫註解說明 name="global.memo"
#160506-00017#1   2016/05/06  by 08172    纳入结算单修改
#160512-00003#3   2016/05/16  by 07959    新增元件供流通查询作业调用：
#                                         1.按照scc的设置显示画面 其他查询条件1/2/3的scc内容，同时隐藏画面相关的栏位，传参scc编号/栏位1/栏位2
#                                         2.栏位开窗，传参：scc编号/scc值/栏位1/栏位2，根据传参和scc的设置开窗
#                                           栏位1/栏位2，传gzcb004/gzcb005，gzcb006/gzcb007，传哪个就抓哪个栏位对应的r.q，或者要隐藏的栏位，如果传入值为null，默认抓gzcb004~006
#160523-00009#1   2016/05/25  by 08172    经营方式scc显示修改
##160523-00009#5  2016/05/27  by geza     add astq330来源类型显示 4.销售和5.销退，可以查询成本代销对应的底稿资料 
#160627-00020#1   2016/06/28  by 08172    报错修改及错误提示修改
#160905-00007#16  2016/09/05  By 02599    SQL条件增加ent,问题在2322行，下载程序架构自动产生ENT
#160913-00034#2   2016/09/14  by 08742    q_pmaa001開窗改成 q_pmaa001_1抓類型=3 的條件
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS   #(ver:36) add
   DEFINE mc_data_owner_check LIKE type_t.num5   #(ver:36) add
END GLOBALS   #(ver:36) add
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_stbc_d RECORD
       stbc001 LIKE type_t.chr10, 
   stbc001_desc LIKE type_t.chr500, 
   stbc002 LIKE type_t.dat, 
   stbc003 LIKE type_t.chr10, 
   stbc004 LIKE type_t.chr20, 
   stbc005 LIKE type_t.num10, 
   stbc006 LIKE type_t.num10, 
   stbc007 LIKE type_t.num5, 
   stbc028 LIKE type_t.num5, 
   stbc045 LIKE type_t.dat, 
   stbc046 LIKE type_t.dat, 
   stbcsite LIKE type_t.chr10, 
   stbcsite_desc LIKE type_t.chr500, 
   stbc026 LIKE type_t.chr10, 
   stbc025 LIKE type_t.chr10, 
   stbc027 LIKE type_t.chr10, 
   stbc008 LIKE type_t.chr10, 
   stbc008_desc LIKE type_t.chr500, 
   stbc029 LIKE type_t.chr10, 
   stbc029_desc LIKE type_t.chr500, 
   stbc030 LIKE type_t.chr20, 
   stbc009 LIKE type_t.chr10, 
   stbc010 LIKE type_t.chr10, 
   stbc010_desc LIKE type_t.chr500, 
   stbc011 LIKE type_t.chr10, 
   stbc011_desc LIKE type_t.chr500, 
   stbc012 LIKE type_t.chr10, 
   stbc012_desc LIKE type_t.chr500, 
   stbc037 LIKE type_t.chr1, 
   stbc038 LIKE type_t.chr1, 
   stbc058 LIKE type_t.chr1, 
   stbc013 LIKE type_t.chr4, 
   stbc013_desc LIKE type_t.chr500, 
   stbc014 LIKE type_t.chr10, 
   stbc014_desc LIKE type_t.chr500, 
   stbc015 LIKE type_t.chr10, 
   stbc016 LIKE type_t.num5, 
   stbc017 LIKE type_t.num20_6, 
   stbc018 LIKE type_t.num20_6, 
   stbc019 LIKE type_t.num20_6, 
   stbc020 LIKE type_t.num20_6, 
   stbc021 LIKE type_t.num20_6, 
   stbc022 LIKE type_t.num20_6, 
   stbc023 LIKE type_t.num20_6, 
   stbc024 LIKE type_t.num20_6, 
   stbc034 LIKE type_t.num20_6, 
   stbc057 LIKE type_t.num20_6, 
   stbc035 LIKE type_t.num20_6, 
   stbc036 LIKE type_t.num20_6, 
   stbc039 LIKE type_t.num20_6, 
   stbc040 LIKE type_t.dat, 
   stbc042 LIKE type_t.num20_6, 
   stbc043 LIKE type_t.chr500, 
   stbc044 LIKE type_t.chr10, 
   stbcstus LIKE type_t.chr10, 
   sel LIKE type_t.chr500
       END RECORD
 
 
 
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_wc   STRING
DEFINE g_wc3   STRING
DEFINE g_stbcsite_m     LIKE stbc_t.stbcsite
DEFINE g_stbc002_m      LIKE stbc_t.stbc002
DEFINE g_select_1     LIKE type_t.chr10
DEFINE g_select_2     LIKE type_t.chr10
DEFINE g_select_3     LIKE type_t.chr10
DEFINE g_rcnt           LIKE type_t.num5   #160627-00020#1
#end add-point
 
#模組變數(Module Variables)
DEFINE g_stbc_d          DYNAMIC ARRAY OF type_g_stbc_d #單身變數
DEFINE g_stbc_d_t        type_g_stbc_d                  #單身備份
DEFINE g_stbc_d_o        type_g_stbc_d                  #單身備份
DEFINE g_stbc_d_mask_o   DYNAMIC ARRAY OF type_g_stbc_d #單身變數
DEFINE g_stbc_d_mask_n   DYNAMIC ARRAY OF type_g_stbc_d #單身變數
 
      
DEFINE g_wc2                STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_temp_idx           LIKE type_t.num10             #單身 所在筆數(暫存用)
DEFINE g_detail_idx         LIKE type_t.num10             #單身 所在筆數(所有資料)
DEFINE g_detail_cnt         LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_chk                BOOLEAN
DEFINE g_aw                 STRING                        #確定當下點擊的單身
DEFINE g_log1               STRING                        #log用
DEFINE g_log2               STRING                        #log用
 
#多table用wc
DEFINE g_wc_table           STRING
 
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astq330.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:作業初始化 name="main.init"
   LET g_argv[1] = cl_replace_str(g_argv[1], '\"', '')
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
 
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT stbc001,stbc002,stbc003,stbc004,stbc005,stbc006,stbc007,stbc028,stbc045, 
       stbc046,stbcsite,stbc026,stbc025,stbc027,stbc008,stbc029,stbc030,stbc009,stbc010,stbc011,stbc012, 
       stbc037,stbc038,stbc058,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018,stbc019,stbc020,stbc021, 
       stbc022,stbc023,stbc024,stbc034,stbc057,stbc035,stbc036,stbc039,stbc040,stbc042,stbc043,stbc044, 
       stbcstus FROM stbc_t WHERE stbcent=? AND stbc001=? AND stbc004=? AND stbc005=? FOR UPDATE"
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq330_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq330 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq330_init()   
 
      #進入選單 Menu (="N")
      CALL astq330_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq330
      
   END IF 
   
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq330.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION astq330_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
      CALL cl_set_combo_scc_part('stbcstus','50','N,Y,X')
 
   
   LET g_error_show = 1
   
   #add-point:畫面資料初始化 name="init.init"
   #CALL cl_set_combo_scc_part('b_stbc003','6703','1,2,3,8,11') #mark by geza 20160527 #160523-00009#5
   CALL cl_set_combo_scc_part('b_stbc003','6703','1,2,3,4,5,8,11') #add geza 20160527 #160523-00009#5
   CALL cl_set_combo_scc('b_stbcstus','6704')
   CALL cl_set_combo_scc('combobox_1','6906')
   CALL cl_set_combo_scc('combobox_2','6906')
   CALL cl_set_combo_scc('combobox_3','6906') 
   #CALL cl_set_combo_scc_part('stbc003','6703','1,2,3,8,11')   #mark by geza 20160527 #160523-00009#5
   CALL cl_set_combo_scc_part('stbc003','6703','1,2,3,4,5,8,11')   #add by geza 20160527 #160523-00009#5
   CALL cl_set_combo_scc('stbc027','6726')   
   CALL cl_set_combo_scc('stbc015','6006')
   CALL cl_set_combo_scc('stbcstus','6704')
   IF g_argv[1]='2' THEN
      CALL cl_set_combo_scc_part('b_stbc009','6013','11,12,13')
      CALL cl_set_combo_scc_part('stbc009','6013','11,12,13')
   ELSE
      CALL cl_set_combo_scc_part('b_stbc009','6013','1,2,3')         #160523-00009#1    by 08172 
      CALL cl_set_combo_scc_part('stbc009','6013','1,2,3')
   END IF

#   IF g_argv[1]='2' THEN
##      CALL cl_set_combo_scc_part('stbc009','6725','11,12,13')
#      CALL cl_set_combo_scc_part('stbc009','6013','11,12,13')
#      CALL cl_set_comp_visible("stbc029,stbc029_desc,stbc030",TRUE)
#      CALL cl_set_combo_scc_part('stbc003','6703','1,2,3,4,5,9,10,11')      #huangrh add---20150604不顯示扣率代銷   add by geza 20150714 加类型11 供应商往来调整
#   ELSE
##      CALL cl_set_combo_scc_part('stbc009','6725','1,2,3')
#      CALL cl_set_combo_scc_part('stbc009','6013','1,2,3,4,5')
##      CALL cl_set_comp_visible("stbc029,stbc029_desc,stbc030",FALSE)   #mark by yangxf
#      CALL cl_set_comp_visible("stbc029,stbc029_desc",FALSE)            #add by yangxf
#   #   CALL cl_set_combo_scc_part('stbc003','6703','1,2,3,6,7,8')        #huangrh add---20150604添加扣率代銷，隱藏銷售和銷退  mark by geza 20150628
#   #   CALL cl_set_combo_scc_part('stbc003','6703','1,2,3,8,9,10,11')        #geza add---20150628隱藏6.其他加项和7.其他减项  add by geza 20150714 加类型11 供应商往来调整
#      CALL cl_set_combo_scc_part('stbc003','6703','1,2,3,8,11')         #pengxin add---20150316隐藏9虚拟入库单,10虚拟退厂单  add by pengxin 20160316
#   END IF
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
#   CALL astq330_set_no_visible()    #160512-00003#3   by 07959 160516   mark
#   CALL s_qry_set_field_visible('6906','','')   #160512-00003#3 by 07959 160516 add   动态选择QBE查询条件，动态关闭单身相关栏位
   IF g_argv[1]='2' THEN   #g_argv[1]='2'表示是astq630
      CALL s_qry_set_field_visible('6906','gzcb008','gzcb007')
   ELSE
      CALL s_qry_set_field_visible('6906','','')
   END IF
   #end add-point
   
   CALL astq330_default_search()
   
END FUNCTION
 
{</section>}
 
{<section id="astq330.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION astq330_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx   LIKE type_t.num10
   DEFINE la_param  RECORD #串查用
             prog   STRING,
             param  DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING
   DEFINE l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_arg             STRING                 #報表作業cmdrun使用
   #add-point:ui_dialog段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE  l_cnt                  LIKE type_t.num10 
   DEFINE  l_query                LIKE gzcb_t.gzcb004
   DEFINE  l_cmd                STRING   
   #end add-point 
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   LET g_rcnt = 0    #160627-00020#1
   #end add-point
   
   LET g_action_choice = " "  
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()      
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   
   LET g_detail_idx = 1
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stbc_d.clear()
 
         LET g_wc2 = ' 1=2'
         LET g_action_choice = ""
         CALL astq330_init()
      END IF
   
      CALL astq330_b_fill(g_wc2)
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_stbc_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               #add-point:ui_dialog段before display  name="ui_dialog.body.before_display"
               
               #end add-point
               #讓各頁籤能夠同步指到特定資料
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               #add-point:ui_dialog段before display2 name="ui_dialog.body.before_display2"
               
               #end add-point
               
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               LET g_temp_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:3)
   CALL astq330_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
               #add-point:display array-before row name="ui_dialog.before_row"
               
               #end add-point
         
            #自訂ACTION(detail_show,page_1)
            
               
         END DISPLAY
      
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         CONSTRUCT g_wc
                ON stbc001,stbcsite,stbc008,stbc030,stbc002,stbc003,stbc004,stbc025,stbcstus,stbc009,stbc040,stbc012
              FROM b_stbc001,b_stbcsite,b_stbc008,b_stbc030,b_stbc002,b_stbc003,b_stbc004,b_stbc025,b_stbcstus,b_stbc009,b_stbc040,b_stbc012
            BEFORE CONSTRUCT
            
            ON ACTION controlp INFIELD b_stbc001
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               CALL q_ooef001_23()
               DISPLAY g_qryparam.return1 TO b_stbc001
               NEXT FIELD b_stbc001
            ON ACTION controlp INFIELD b_stbcsite
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbcsite',g_site,'c')
               CALL q_ooef001_24()
               DISPLAY g_qryparam.return1 TO b_stbcsite
               NEXT FIELD b_stbcsite
           ON ACTION controlp INFIELD b_stbc008
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               #160913-00034#2 -S
               #CALL q_pmaa001()                           #呼叫開窗            
               LET g_qryparam.arg1 = "('3')"            
               CALL q_pmaa001_1()                           #呼叫開窗
               #160913-00034#2 -E
               DISPLAY g_qryparam.return1 TO b_stbc008
               NEXT FIELD b_stbc008
            ON ACTION controlp INFIELD b_stbc030
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               IF g_argv[1]='2' THEN
                  CALL q_stce001_4()
               ELSE
                  CALL q_stan001_2()
               END IF
               DISPLAY g_qryparam.return1 TO b_stbc030
               NEXT FIELD b_stbc030 
            ON ACTION controlp INFIELD b_stbc004
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               CALL q_stbc003()
               DISPLAY g_qryparam.return1 TO b_stbc004
               NEXT FIELD b_stbc004
            ON ACTION controlp INFIELD b_stbc025
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1=cl_get_para(g_enterprise,g_site,'E-CIR-0001')
               CALL q_rtax001_3()
               DISPLAY g_qryparam.return1 TO b_stbc025
               NEXT FIELD b_stbc025
            ON ACTION controlp INFIELD b_stbc012
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               CALL q_stae001()
               DISPLAY g_qryparam.return1 TO b_stbc012
               NEXT FIELD b_stbc012


                  
            AFTER CONSTRUCT  
         END CONSTRUCT      
         INPUT g_select_1,g_select_2,g_select_3 FROM combobox_1,combobox_2,combobox_3
         
         END INPUT
         CONSTRUCT BY NAME g_wc3 ON field1,field2,field3
             ON ACTION controlp INFIELD field1
                INITIALIZE g_qryparam.* TO NULL 
                LET g_qryparam.state = "c"
                LET g_qryparam.reqry = FALSE
#                #160512-00003#3 2016/05/16  mark(S)
#                CASE g_select_1
#                   WHEN 4
#                      CALL q_staa001()
#                   WHEN 5
#                      LET g_qryparam.arg1='2060'
#                      CALL q_oocq002()
#                   WHEN 6
#                      LET g_qryparam.arg1=g_site
#                      CALL q_ooaj002_1()
#                   WHEN 7
#                      CALL q_oodb002()
#                END CASE
#                #160512-00003#3 2016/05/16  mark(E)
                #160512-00003#3 2016/05/16  add(S)
                CASE g_select_1
                   WHEN 5
                      LET g_qryparam.arg1='2060'
                   WHEN 6
                      LET g_qryparam.arg1=g_site
                END CASE
                CALL s_qry_set_ctrlp('6906',g_select_1,'','')
                #160512-00003#3 2016/05/16  add(E)
                DISPLAY g_qryparam.return1 TO field1
                NEXT FIELD field1
             ON ACTION controlp INFIELD field2
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
#                #160512-00003#3 2016/05/16  mark(S)
#               CASE g_select_2
#                  WHEN 4
#                      CALL q_staa001()
#                   WHEN 5
#                      LET g_qryparam.arg1='2060'
#                      CALL q_oocq002()
#                   WHEN 6
#                      LET g_qryparam.arg1=g_site
#                      CALL q_ooaj002_1()
#                   WHEN 7
#                      CALL q_oodb002()
#               END CASE
#                #160512-00003#3 2016/05/16  mark(E)
               #160512-00003#3 2016/05/16  add(S)
               CASE g_select_2
                   WHEN 5
                      LET g_qryparam.arg1='2060'
                   WHEN 6
                      LET g_qryparam.arg1=g_site
               END CASE
               CALL s_qry_set_ctrlp('6906',g_select_2,'','')
               #160512-00003#3 2016/05/16  add(E)
               DISPLAY g_qryparam.return1 TO field2
               NEXT FIELD field2
             ON ACTION controlp INFIELD field3
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
#                #160512-00003#3 2016/05/16  mark(S)
#               CASE g_select_3
#                  WHEN 4
#                      CALL q_staa001()
#                   WHEN 5
#                      LET g_qryparam.arg1='2060'
#                      CALL q_oocq002()
#                   WHEN 6
#                      LET g_qryparam.arg1=g_site
#                      CALL q_ooaj002_1()
#                   WHEN 7
#                      
#                      CALL q_oodb002()
#               END CASE
#                #160512-00003#3 2016/05/16  mark(E)
               #160512-00003#3 2016/05/16  add(S)
               CASE g_select_3
                   WHEN 5
                      LET g_qryparam.arg1='2060'
                   WHEN 6
                      LET g_qryparam.arg1=g_site
               END CASE
               CALL s_qry_set_ctrlp('6906',g_select_3,'','')
               #160512-00003#3 2016/05/16  add(E)
               DISPLAY g_qryparam.return1 TO field3
               NEXT FIELD field3

         END CONSTRUCT

         #end add-point
    
         BEFORE DIALOG
            IF g_temp_idx > 0 THEN
               LET l_ac = g_temp_idx
               CALL DIALOG.setCurrentRow("s_detail1",l_ac)
               LET g_temp_idx = 1
            END IF
            LET g_curr_diag = ui.DIALOG.getCurrent()         
            CALL DIALOG.setSelectionMode("s_detail1", 1)
 
            #add-point:ui_dialog段before name="ui_dialog.b_dialog"
            DISPLAY g_site TO b_stbcsite
            DISPLAY g_today TO b_stbc002
            LET g_select_1=4
            LET g_select_2=21
            LET g_select_3=7
            
            DISPLAY g_select_1 TO combobox_1
            DISPLAY g_select_2 TO combobox_2
            DISPLAY g_select_3 TO combobox_3
            #end add-point
            NEXT FIELD CURRENT
      
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION change
            LET g_action_choice="change"
            IF cl_auth_chk_act("change") THEN
               
               #add-point:ON ACTION change name="menu.change"
               LET g_aw = g_curr_diag.getCurrentItem()               
               LET l_cnt = g_stbc_d.getLength()
               IF l_cnt > 0 THEN                   
                  CALL astq330_modify()
               ELSE   
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00368'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_action_choice= ""
                  EXIT DIALOG
               END IF
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION datainfo
            LET g_action_choice="datainfo"
            IF cl_auth_chk_act("datainfo") THEN
               
               #add-point:ON ACTION datainfo name="menu.datainfo"
               
               #END add-point
               
            END IF
 
 
 
 
      
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_stbc_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               
               #END add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
            
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice="exit"
            CANCEL DIALOG
      
         ON ACTION exit
            LET g_action_choice="exit"
            CANCEL DIALOG
            
         
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astq330_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astq330_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astq330_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            CALL cl_user_overview_follow('')
       

         ON ACTION accept
            IF cl_null(g_wc) THEN
               LET g_wc="1=1"
            END IF            
            CALL astq330_b_fill(g_wc)
         
         ON ACTION cancel
               LET g_action_choice="exit"
               EXIT DIALOG
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
         
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
      
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq330.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION astq330_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_stbc_d.clear()
   
   LET g_qryparam.state = "c"
   
   #wc備份
   LET ls_wc = g_wc2
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      CONSTRUCT g_wc2 ON NULL 
 
         FROM NULL 
      
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stbccrtdt>>----
 
         #----<<stbcmoddt>>----
         
         #----<<stbccnfdt>>----
         
         #----<<stbcpstdt>>----
 
 
 
      
           
         
 
      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.before_construct"
            
            #end add-point 
      
      END CONSTRUCT
  
      #add-point:query段more_construct name="query.more_construct"
      
      #end add-point 
  
      BEFORE DIALOG 
         CALL cl_qbe_init()
         #add-point:query段before_dialog name="query.before_dialog"
         
         #end add-point 
      
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
      
      ON ACTION qbe_save
         CALL cl_qbe_save()
      
      ON ACTION accept
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
         CANCEL DIALOG
      
      #交談指令共用ACTION
      &include "common_action.4gl"
      CONTINUE DIALOG 
   END DIALOG
 
   #add-point:query段after_construct name="query.after_construct"
   
   #end add-point
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      #LET g_wc2 = ls_wc
      LET g_wc2 = " 1=2"
      RETURN
   ELSE
      LET g_error_show = 1
      LET g_detail_idx = 1
   END IF
    
   CALL astq330_b_fill(g_wc2)
 
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = -100 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
   END IF
   
   LET INT_FLAG = FALSE
   
END FUNCTION
 
{</section>}
 
{<section id="astq330.insert" >}
#+ 資料新增
PRIVATE FUNCTION astq330_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point                
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #add-point:單身新增前 name="insert.b_insert"
   
   #end add-point
   
   LET g_insert = 'Y'
   CALL astq330_modify()
            
   #add-point:單身新增後 name="insert.a_insert"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq330.modify" >}
#+ 資料修改
PRIVATE FUNCTION astq330_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point
   DEFINE  l_cmd                  LIKE type_t.chr1
   DEFINE  l_ac_t                 LIKE type_t.num10               #未取消的ARRAY CNT 
   DEFINE  l_n                    LIKE type_t.num10               #檢查重複用  
   DEFINE  l_cnt                  LIKE type_t.num10               #檢查重複用  
   DEFINE  l_lock_sw              LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert         LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete         LIKE type_t.num5                #可刪除否  
   DEFINE  l_count                LIKE type_t.num10
   DEFINE  l_i                    LIKE type_t.num10
   DEFINE  ls_return              STRING
   DEFINE  l_var_keys             DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys           DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                 DYNAMIC ARRAY OF STRING
   DEFINE  l_fields               DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak         DYNAMIC ARRAY OF STRING
   DEFINE  li_reproduce           LIKE type_t.num10
   DEFINE  li_reproduce_target    LIKE type_t.num10
   DEFINE  lb_reproduce           BOOLEAN
   DEFINE  l_insert               BOOLEAN
   #add-point:modify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
#  LET g_action_choice = ""   #(ver:35) mark
   
   LET g_qryparam.state = "i"
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   
   #add-point:modify開始前 name="modify.define_sql"
   
   #end add-point
   
   LET INT_FLAG = FALSE
   LET lb_reproduce = FALSE
   LET l_insert = FALSE
 
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
 
   #add-point:modify段修改前 name="modify.before_input"
   
   #end add-point
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #Page1 預設值產生於此處
      INPUT ARRAY g_stbc_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_detail_cnt,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbc_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astq330_b_fill(g_wc2)
            LET g_detail_cnt = g_stbc_d.getLength()
         
         BEFORE ROW
            #add-point:modify段before row name="input.body.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = g_detail_idx
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
            DISPLAY g_stbc_d.getLength() TO FORMONLY.cnt
         
            CALL s_transaction_begin()
            LET g_detail_cnt = g_stbc_d.getLength()
            
            IF g_detail_cnt >= l_ac 
               AND g_stbc_d[l_ac].stbc001 IS NOT NULL
               AND g_stbc_d[l_ac].stbc004 IS NOT NULL
               AND g_stbc_d[l_ac].stbc005 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stbc_d_t.* = g_stbc_d[l_ac].*  #BACKUP
               LET g_stbc_d_o.* = g_stbc_d[l_ac].*  #BACKUP
               IF NOT astq330_lock_b("stbc_t") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astq330_bcl INTO g_stbc_d[l_ac].stbc001,g_stbc_d[l_ac].stbc002,g_stbc_d[l_ac].stbc003, 
                      g_stbc_d[l_ac].stbc004,g_stbc_d[l_ac].stbc005,g_stbc_d[l_ac].stbc006,g_stbc_d[l_ac].stbc007, 
                      g_stbc_d[l_ac].stbc028,g_stbc_d[l_ac].stbc045,g_stbc_d[l_ac].stbc046,g_stbc_d[l_ac].stbcsite, 
                      g_stbc_d[l_ac].stbc026,g_stbc_d[l_ac].stbc025,g_stbc_d[l_ac].stbc027,g_stbc_d[l_ac].stbc008, 
                      g_stbc_d[l_ac].stbc029,g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009,g_stbc_d[l_ac].stbc010, 
                      g_stbc_d[l_ac].stbc011,g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037,g_stbc_d[l_ac].stbc038, 
                      g_stbc_d[l_ac].stbc058,g_stbc_d[l_ac].stbc013,g_stbc_d[l_ac].stbc014,g_stbc_d[l_ac].stbc015, 
                      g_stbc_d[l_ac].stbc016,g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018,g_stbc_d[l_ac].stbc019, 
                      g_stbc_d[l_ac].stbc020,g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbc022,g_stbc_d[l_ac].stbc023, 
                      g_stbc_d[l_ac].stbc024,g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057,g_stbc_d[l_ac].stbc035, 
                      g_stbc_d[l_ac].stbc036,g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc040,g_stbc_d[l_ac].stbc042, 
                      g_stbc_d[l_ac].stbc043,g_stbc_d[l_ac].stbc044,g_stbc_d[l_ac].stbcstus
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stbc_d_t.stbc001,":",SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stbc_d_mask_o[l_ac].* =  g_stbc_d[l_ac].*
                  CALL astq330_stbc_t_mask()
                  LET g_stbc_d_mask_n[l_ac].* =  g_stbc_d[l_ac].*
                  
                  CALL astq330_detail_show()
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            CALL astq330_set_entry_b(l_cmd)
            CALL astq330_set_no_entry_b(l_cmd)
            #add-point:modify段before row name="input.body.before_row"
            IF l_cmd = 'a' THEN               
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            CALL astq330_set_entry_b("a")
            CALL astq330_set_no_entry_b("a")
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
        
         BEFORE INSERT
            
            LET l_insert = TRUE
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stbc_d_t.* TO NULL
            INITIALIZE g_stbc_d_o.* TO NULL
            INITIALIZE g_stbc_d[l_ac].* TO NULL 
            #公用欄位給值(單身)
            #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stbc_d[l_ac].stbcstus = ''
 
 
 
            #自定義預設值(單身1)
                  LET g_stbc_d[l_ac].stbc017 = "0"
      LET g_stbc_d[l_ac].stbc018 = "0"
      LET g_stbc_d[l_ac].stbc019 = "0"
      LET g_stbc_d[l_ac].stbc020 = "0"
      LET g_stbc_d[l_ac].stbc021 = "0"
      LET g_stbc_d[l_ac].stbc022 = "0"
      LET g_stbc_d[l_ac].stbc023 = "0"
      LET g_stbc_d[l_ac].stbc024 = "0"
      LET g_stbc_d[l_ac].stbc034 = "0"
      LET g_stbc_d[l_ac].stbc057 = "0"
      LET g_stbc_d[l_ac].stbc035 = "0"
      LET g_stbc_d[l_ac].stbc036 = "0"
      LET g_stbc_d[l_ac].stbc039 = "0"
      LET g_stbc_d[l_ac].stbc042 = "0"
 
            #add-point:modify段before備份 name="input.body.before_bak"
            
            #end add-point
            LET g_stbc_d_t.* = g_stbc_d[l_ac].*     #新輸入資料
            LET g_stbc_d_o.* = g_stbc_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stbc_d[li_reproduce_target].* = g_stbc_d[li_reproduce].*
 
               LET g_stbc_d[g_stbc_d.getLength()].stbc001 = NULL
               LET g_stbc_d[g_stbc_d.getLength()].stbc004 = NULL
               LET g_stbc_d[g_stbc_d.getLength()].stbc005 = NULL
 
            END IF
            
 
            CALL astq330_set_entry_b(l_cmd)
            CALL astq330_set_no_entry_b(l_cmd)
            #add-point:modify段before insert name="input.body.before_insert"
            
            #end add-point  
  
         AFTER INSERT
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stbc_t 
             WHERE stbcent = g_enterprise AND stbc001 = g_stbc_d[l_ac].stbc001
                                       AND stbc004 = g_stbc_d[l_ac].stbc004
                                       AND stbc005 = g_stbc_d[l_ac].stbc005
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbc_d[g_detail_idx].stbc001
               LET gs_keys[2] = g_stbc_d[g_detail_idx].stbc004
               LET gs_keys[3] = g_stbc_d[g_detail_idx].stbc005
               CALL astq330_insert_b('stbc_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stbc_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code   = "std-00006" 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astq330_b_fill(g_wc2)
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               ##ERROR 'INSERT O.K'
               LET g_detail_cnt = g_detail_cnt + 1
               
               LET g_wc2 = g_wc2, " OR (stbc001 = '", g_stbc_d[l_ac].stbc001, "' "
                                  ," AND stbc004 = '", g_stbc_d[l_ac].stbc004, "' "
                                  ," AND stbc005 = '", g_stbc_d[l_ac].stbc005, "' "
 
                                  ,")"
            END IF                
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
            ELSE
               #add-point:單身刪除ask前 name="input.body.b_delete_ask"
               
               #end add-point   
               
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = -263 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身刪除前 name="input.body.b_delete"
               
               #end add-point   
               
               DELETE FROM stbc_t
                WHERE stbcent = g_enterprise AND 
                      stbc001 = g_stbc_d_t.stbc001
                      AND stbc004 = g_stbc_d_t.stbc004
                      AND stbc005 = g_stbc_d_t.stbc005
 
                      
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point  
                      
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  CANCEL DELETE   
               ELSE
                  LET g_detail_cnt = g_detail_cnt-1
                  
 
                  #add-point:單身刪除後 name="input.body.a_delete"
                  
                  #end add-point
                  #修改歷程記錄(刪除)
                  CALL astq330_set_pk_array()
                  LET g_log1 = util.JSON.stringify(g_stbc_d[l_ac])   #(ver:38)
                  IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:38)
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                  END IF
               END IF 
               CLOSE astq330_bcl
               #add-point:單身關閉bcl name="input.body.close"
               
               #end add-point
               LET l_count = g_stbc_d.getLength()
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbc_d_t.stbc001
               LET gs_keys[2] = g_stbc_d_t.stbc004
               LET gs_keys[3] = g_stbc_d_t.stbc005
 
               #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astq330_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            END IF 
              
         AFTER DELETE 
            IF l_cmd <> 'd' THEN
               #add-point:單身刪除後2 name="input.body.after_delete"
               
               #end add-point
                              CALL astq330_delete_b('stbc_t',gs_keys,"'1'")
            END IF
            #如果是最後一筆
            IF l_ac = (g_stbc_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            #add-point:單身刪除後3 name="input.body.after_delete3"
            
            #end add-point
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc001
            
            #add-point:AFTER FIELD stbc001 name="input.a.page1.stbc001"
            #此段落由子樣板a05產生
            IF  g_stbc_d[g_detail_idx].stbc001 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc011 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbc_d[g_detail_idx].stbc001 != g_stbc_d_t.stbc001 OR g_stbc_d[g_detail_idx].stbc011 != g_stbc_d_t.stbc011)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbc_t WHERE "||"stbcent = '" ||g_enterprise|| "' AND "||"stbc001 = '"||g_stbc_d[g_detail_idx].stbc001 ||"' AND "|| "stbc011 = '"||g_stbc_d[g_detail_idx].stbc011 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc001
            #add-point:BEFORE FIELD stbc001 name="input.b.page1.stbc001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc001
            #add-point:ON CHANGE stbc001 name="input.g.page1.stbc001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc004
            #add-point:BEFORE FIELD stbc004 name="input.b.page1.stbc004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc004
            
            #add-point:AFTER FIELD stbc004 name="input.a.page1.stbc004"
            #此段落由子樣板a05產生
            IF  g_stbc_d[g_detail_idx].stbc001 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc004 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc005 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbc_d[g_detail_idx].stbc001 != g_stbc_d_t.stbc001 OR g_stbc_d[g_detail_idx].stbc004 != g_stbc_d_t.stbc004 OR g_stbc_d[g_detail_idx].stbc005 != g_stbc_d_t.stbc005)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbc_t WHERE "||"stbcent = '" ||g_enterprise|| "' AND "||"stbc001 = '"||g_stbc_d[g_detail_idx].stbc001 ||"' AND "|| "stbc004 = '"||g_stbc_d[g_detail_idx].stbc004 ||"' AND "|| "stbc005 = '"||g_stbc_d[g_detail_idx].stbc005 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc004
            #add-point:ON CHANGE stbc004 name="input.g.page1.stbc004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbc005
            #add-point:BEFORE FIELD stbc005 name="input.b.page1.stbc005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbc005
            
            #add-point:AFTER FIELD stbc005 name="input.a.page1.stbc005"
            #此段落由子樣板a05產生
            IF  g_stbc_d[g_detail_idx].stbc001 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc004 IS NOT NULL AND g_stbc_d[g_detail_idx].stbc005 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbc_d[g_detail_idx].stbc001 != g_stbc_d_t.stbc001 OR g_stbc_d[g_detail_idx].stbc004 != g_stbc_d_t.stbc004 OR g_stbc_d[g_detail_idx].stbc005 != g_stbc_d_t.stbc005)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbc_t WHERE "||"stbcent = '" ||g_enterprise|| "' AND "||"stbc001 = '"||g_stbc_d[g_detail_idx].stbc001 ||"' AND "|| "stbc004 = '"||g_stbc_d[g_detail_idx].stbc004 ||"' AND "|| "stbc005 = '"||g_stbc_d[g_detail_idx].stbc005 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbc005
            #add-point:ON CHANGE stbc005 name="input.g.page1.stbc005"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stbc001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc001
            #add-point:ON ACTION controlp INFIELD stbc001 name="input.c.page1.stbc001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc004
            #add-point:ON ACTION controlp INFIELD stbc004 name="input.c.page1.stbc004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbc005
            #add-point:ON ACTION controlp INFIELD stbc005 name="input.c.page1.stbc005"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               CLOSE astq330_bcl
               CALL s_transaction_end('N','0')
               LET INT_FLAG = 0
               LET g_stbc_d[l_ac].* = g_stbc_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               #add-point:單身取消時 name="input.body.cancel"
               
               #end add-point
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbc_d[l_ac].stbc001 
               LET g_errparam.code   = -263 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET g_stbc_d[l_ac].* = g_stbc_d_t.*
            ELSE
               #寫入修改者/修改日期資訊(單身)
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL astq330_stbc_t_mask_restore('restore_mask_o')
 
               UPDATE stbc_t SET (stbc001,stbc002,stbc003,stbc004,stbc005,stbc006,stbc007,stbc028,stbc045, 
                   stbc046,stbcsite,stbc026,stbc025,stbc027,stbc008,stbc029,stbc030,stbc009,stbc010, 
                   stbc011,stbc012,stbc037,stbc038,stbc058,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018, 
                   stbc019,stbc020,stbc021,stbc022,stbc023,stbc024,stbc034,stbc057,stbc035,stbc036,stbc039, 
                   stbc040,stbc042,stbc043,stbc044,stbcstus) = (g_stbc_d[l_ac].stbc001,g_stbc_d[l_ac].stbc002, 
                   g_stbc_d[l_ac].stbc003,g_stbc_d[l_ac].stbc004,g_stbc_d[l_ac].stbc005,g_stbc_d[l_ac].stbc006, 
                   g_stbc_d[l_ac].stbc007,g_stbc_d[l_ac].stbc028,g_stbc_d[l_ac].stbc045,g_stbc_d[l_ac].stbc046, 
                   g_stbc_d[l_ac].stbcsite,g_stbc_d[l_ac].stbc026,g_stbc_d[l_ac].stbc025,g_stbc_d[l_ac].stbc027, 
                   g_stbc_d[l_ac].stbc008,g_stbc_d[l_ac].stbc029,g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009, 
                   g_stbc_d[l_ac].stbc010,g_stbc_d[l_ac].stbc011,g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037, 
                   g_stbc_d[l_ac].stbc038,g_stbc_d[l_ac].stbc058,g_stbc_d[l_ac].stbc013,g_stbc_d[l_ac].stbc014, 
                   g_stbc_d[l_ac].stbc015,g_stbc_d[l_ac].stbc016,g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018, 
                   g_stbc_d[l_ac].stbc019,g_stbc_d[l_ac].stbc020,g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbc022, 
                   g_stbc_d[l_ac].stbc023,g_stbc_d[l_ac].stbc024,g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057, 
                   g_stbc_d[l_ac].stbc035,g_stbc_d[l_ac].stbc036,g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc040, 
                   g_stbc_d[l_ac].stbc042,g_stbc_d[l_ac].stbc043,g_stbc_d[l_ac].stbc044,g_stbc_d[l_ac].stbcstus) 
 
                WHERE stbcent = g_enterprise AND
                  stbc001 = g_stbc_d_t.stbc001 #項次   
                  AND stbc004 = g_stbc_d_t.stbc004  
                  AND stbc005 = g_stbc_d_t.stbc005  
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbc_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbc_d[g_detail_idx].stbc001
               LET gs_keys_bak[1] = g_stbc_d_t.stbc001
               LET gs_keys[2] = g_stbc_d[g_detail_idx].stbc004
               LET gs_keys_bak[2] = g_stbc_d_t.stbc004
               LET gs_keys[3] = g_stbc_d[g_detail_idx].stbc005
               LET gs_keys_bak[3] = g_stbc_d_t.stbc005
               CALL astq330_update_b('stbc_t',gs_keys,gs_keys_bak,"'1'")
                     #資料多語言用-增/改
                     
                     #修改歷程記錄(修改)
                     LET g_log1 = util.JSON.stringify(g_stbc_d_t)
                     LET g_log2 = util.JSON.stringify(g_stbc_d[l_ac])
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN
                        CALL s_transaction_end('N','0')
                     END IF
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astq330_stbc_t_mask_restore('restore_mask_n')
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            CALL astq330_unlock_b("stbc_t")
            IF INT_FLAG THEN
               CALL s_transaction_end('N','0')
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stbc_d[l_ac].* = g_stbc_d_t.*
               END IF
               #add-point:單身after row name="input.body.a_close"
               
               #end add-point
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #其他table進行unlock
            
             #add-point:單身after row name="input.body.a_row"
            
            #end add-point
            
         AFTER INPUT
            #add-point:單身input後 name="input.body.a_input"
            
            #end add-point
            #錯誤訊息統整顯示
            #CALL cl_err_collect_show()
            #CALL cl_showmsg()
            
         ON ACTION controlo   
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stbc_d[li_reproduce_target].* = g_stbc_d[li_reproduce].*
 
               LET g_stbc_d[li_reproduce_target].stbc001 = NULL
               LET g_stbc_d[li_reproduce_target].stbc004 = NULL
               LET g_stbc_d[li_reproduce_target].stbc005 = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stbc_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stbc_d.getLength()+1
            END IF
            
      END INPUT
      
 
      
 
      
      #add-point:before_more_input name="input.more_input"
      
      #end add-point
      
      BEFORE DIALOG
         #CALL cl_err_collect_init()      
         IF g_temp_idx > 0 THEN
            LET l_ac = g_temp_idx
            CALL DIALOG.setCurrentRow("s_detail1",l_ac)
            LET g_temp_idx = 1
         END IF
         #LET g_curr_diag = ui.DIALOG.getCurrent()
         #add-point:before_dialog name="input.before_dialog"
         
         #end add-point
         CASE g_aw
            WHEN "s_detail1"
               NEXT FIELD stbc001
 
         END CASE
   
      ON ACTION accept
         ACCEPT DIALOG
      
      ON ACTION cancel
         LET INT_FLAG = TRUE 
         CANCEL DIALOG
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) 
              RETURNING g_fld_name,g_frm_name 
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) 
           
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   
   END DIALOG 
    
   #新增後取消
   IF l_cmd = 'a' THEN
      #當取消或無輸入資料按確定時刪除對應資料
      IF INT_FLAG OR cl_null(g_stbc_d[g_detail_idx].stbc001) THEN
         CALL g_stbc_d.deleteElement(g_detail_idx)
 
      END IF
   END IF
   
   #修改後取消
   IF l_cmd = 'u' AND INT_FLAG THEN
      LET g_stbc_d[g_detail_idx].* = g_stbc_d_t.*
   END IF
   
   #add-point:modify段修改後 name="modify.after_input"
   
   #end add-point
 
   CLOSE astq330_bcl
   CALL s_transaction_end('Y','0')
   
END FUNCTION
 
{</section>}
 
{<section id="astq330.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astq330_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point
   DEFINE li_idx          LIKE type_t.num10
   DEFINE li_ac_t         LIKE type_t.num10
   DEFINE li_detail_tmp   LIKE type_t.num10
   DEFINE l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak  DYNAMIC ARRAY OF STRING
   DEFINE l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE l_vars          DYNAMIC ARRAY OF STRING
   DEFINE l_fields        DYNAMIC ARRAY OF STRING
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="delete.body.before_delete"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET li_ac_t = l_ac
   
   LET li_detail_tmp = g_detail_idx
    
   #lock所有所選資料
   FOR li_idx = 1 TO g_stbc_d.getLength()
      LET g_detail_idx = li_idx
      #已選擇的資料
      IF g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         #確定是否有被鎖定
         IF NOT astq330_lock_b("stbc_t") THEN
            #已被他人鎖定
            CALL s_transaction_end('N','0')
            RETURN
         END IF
 
         #(ver:35) ---add start---
         #確定是否有刪除的權限
         #先確定該table有ownid
         IF cl_getField("stbc_t","stbcownid") THEN
            IF NOT cl_auth_chk_act_permission("delete") THEN
               #有目前權限無法刪除的資料
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         END IF
         #(ver:35) --- add end ---
      END IF
   END FOR
   
   #add-point:單身刪除詢問前 name="delete.body.b_delete_ask"
   
   #end add-point  
   
   #詢問是否確定刪除所選資料
   IF NOT cl_ask_del_detail() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   FOR li_idx = 1 TO g_stbc_d.getLength()
      IF g_stbc_d[li_idx].stbc001 IS NOT NULL
         AND g_stbc_d[li_idx].stbc004 IS NOT NULL
         AND g_stbc_d[li_idx].stbc005 IS NOT NULL
 
         AND g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         
         #add-point:單身刪除前 name="delete.body.b_delete"
         
         #end add-point   
         
         DELETE FROM stbc_t
          WHERE stbcent = g_enterprise AND 
                stbc001 = g_stbc_d[li_idx].stbc001
                AND stbc004 = g_stbc_d[li_idx].stbc004
                AND stbc005 = g_stbc_d[li_idx].stbc005
 
         #add-point:單身刪除中 name="delete.body.m_delete"
         
         #end add-point  
                
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            RETURN
         ELSE
            LET g_detail_cnt = g_detail_cnt-1
            LET l_ac = li_idx
            
 
 
            
 
 
            #add-point:單身同步刪除前(同層table) name="delete.body.a_delete"
            
            #end add-point
            LET g_detail_idx = li_idx
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbc_d_t.stbc001
               LET gs_keys[2] = g_stbc_d_t.stbc004
               LET gs_keys[3] = g_stbc_d_t.stbc005
 
            #add-point:單身同步刪除中(同層table) name="delete.body.a_delete2"
            
            #end add-point
                           CALL astq330_delete_b('stbc_t',gs_keys,"'1'")
            #add-point:單身同步刪除後(同層table) name="delete.body.a_delete3"
            
            #end add-point
            #刪除相關文件
            #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astq330_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove.func"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            
         END IF 
      END IF 
    
   END FOR
   CALL s_transaction_end('Y','0')
   
   LET g_detail_idx = li_detail_tmp
            
   #add-point:單身刪除後 name="delete.after"
   
   #end add-point  
   
   LET l_ac = li_ac_t
   
   #刷新資料
   CALL astq330_b_fill(g_wc2)
            
END FUNCTION
 
{</section>}
 
{<section id="astq330.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq330_b_fill(p_wc2)              #BODY FILL UP
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point
   DEFINE p_wc2            STRING
   DEFINE ls_owndept_list  STRING  #(ver:35) add
   DEFINE ls_ownuser_list  STRING  #(ver:35) add
   #add-point:b_fill段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_ooef019  LIKE ooef_t.ooef019
   DEFINE l_where           STRING
   DEFINE l_wd              LIKE gzcb_t.gzcb003
   #end add-point
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   LET p_wc2=g_wc         #160506-00017#1 by 08172
   #end add-point
   
   IF cl_null(p_wc2) THEN
      LET p_wc2 = " 1=1"
   END IF
   
   #add-point:b_fill段sql之前 name="b_fill.sql_before"
#   IF g_argv[1]='2' THEN
#      LET p_wc2 = p_wc2  CLIPPED," AND (stbc009='11' OR stbc009='12' OR stbc009='13')"
#   ELSE
#      LET p_wc2 = p_wc2  CLIPPED," AND (stbc009='1' OR stbc009='2' OR stbc009='3')"
#   END IF
#   CALL s_aooi500_sql_where(g_prog,'stbcsite') RETURNING l_where
#   LET p_wc2 = p_wc2," AND ",l_where
#   LET p_wc2  = p_wc2.trim() 
#   #隱藏對象類型欄位，默認查詢對戲類型為0:供應商，不區分astq330\astq630---huangrh add---20150604
#   LET p_wc2 = p_wc2," AND stbc027='0'"
    CALL s_aooi500_sql_where(g_prog,'stbcsite') RETURNING l_where
    LET p_wc2 = p_wc2," AND ",l_where
    LET p_wc2  = p_wc2.trim()
     
    #160512-00003#3  2016/05/17  mark(S)
#    SELECT gzcb003 INTO l_wd FROM gzcb_t WHERE gzcb001='6906' AND gzcb002=g_select_1
#    LET g_wc3=cl_replace_str(g_wc3, 'field1',l_wd)
#     
#    SELECT gzcb003 INTO l_wd FROM gzcb_t WHERE gzcb001='6906' AND gzcb002=g_select_2
#    LET g_wc3=cl_replace_str(g_wc3, 'field2',l_wd)
#     
#    SELECT gzcb003 INTO l_wd FROM gzcb_t WHERE gzcb001='6906' AND gzcb002=g_select_3
#    LET g_wc3=cl_replace_str(g_wc3, 'field3',l_wd)
    #160512-00003#3  2016/05/17  mark(E)
    #160512-00003#3  2016/05/17  add(S)
    IF NOT cl_null(g_wc3) THEN
       CALL s_qry_field_replace('6906',g_select_1,'field1',g_wc3) RETURNING g_wc3
       CALL s_qry_field_replace('6906',g_select_2,'field2',g_wc3) RETURNING g_wc3
       CALL s_qry_field_replace('6906',g_select_3,'field3',g_wc3) RETURNING g_wc3
    END IF
    #160512-00003#3  2016/05/17  add(E)
    
    
    
    LET p_wc2=p_wc2," AND ",g_wc3
    IF g_argv[1]='2' THEN
       LET p_wc2=p_wc2," AND stbc009 IN ('11','12','13')"
    ELSE
       #LET p_wc2=p_wc2," AND stbc009 IN ('1','3')" #mark by geza 20160527 #160523-00009#5
       LET p_wc2=p_wc2," AND stbc009 IN ('1','2','3')"  #add by geza 20160527 #160523-00009#5
    END IF
   #end add-point
 
   LET g_sql = "SELECT  DISTINCT t0.stbc001,t0.stbc002,t0.stbc003,t0.stbc004,t0.stbc005,t0.stbc006,t0.stbc007, 
       t0.stbc028,t0.stbc045,t0.stbc046,t0.stbcsite,t0.stbc026,t0.stbc025,t0.stbc027,t0.stbc008,t0.stbc029, 
       t0.stbc030,t0.stbc009,t0.stbc010,t0.stbc011,t0.stbc012,t0.stbc037,t0.stbc038,t0.stbc058,t0.stbc013, 
       t0.stbc014,t0.stbc015,t0.stbc016,t0.stbc017,t0.stbc018,t0.stbc019,t0.stbc020,t0.stbc021,t0.stbc022, 
       t0.stbc023,t0.stbc024,t0.stbc034,t0.stbc057,t0.stbc035,t0.stbc036,t0.stbc039,t0.stbc040,t0.stbc042, 
       t0.stbc043,t0.stbc044,t0.stbcstus ,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ,t4.pmaal004 ,t5.staal003 , 
       t6.oocql004 ,t7.stael003 ,t8.ooail003 FROM stbc_t t0",
               "",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbc001 AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stbcsite AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stbc008 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t4 ON t4.pmaalent="||g_enterprise||" AND t4.pmaal001=t0.stbc029 AND t4.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t5 ON t5.staalent="||g_enterprise||" AND t5.staal001=t0.stbc010 AND t5.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t6 ON t6.oocqlent="||g_enterprise||" AND t6.oocql001='2060' AND t6.oocql002=t0.stbc011 AND t6.oocql003='"||g_dlang||"' ",
               " LEFT JOIN stael_t t7 ON t7.staelent="||g_enterprise||" AND t7.stael001=t0.stbc012 AND t7.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t8 ON t8.ooailent="||g_enterprise||" AND t8.ooail001=t0.stbc013 AND t8.ooail002='"||g_dlang||"' ",
 
               " WHERE t0.stbcent= ?  AND  1=1 AND (", p_wc2, ") "
 
   #(ver:35) ---add start---
   
   #(ver:35) --- add end ---
 
   #add-point:b_fill段sql wc name="b_fill.sql_wc"
 
   #end add-point
   LET g_sql = g_sql, cl_sql_add_filter("stbc_t"),
                      " ORDER BY t0.stbc001,t0.stbc004,t0.stbc005"
   
   #add-point:b_fill段sql之後 name="b_fill.sql_after"
   
   #end add-point
   
   #LET g_sql = cl_sql_add_tabid(g_sql,"stbc_t")            #WC重組
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq330_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq330_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_stbc_d.clear()
 
 
   LET g_cnt = l_ac
   LET l_ac = 1   
   ERROR "Searching!" 
 
   FOREACH b_fill_curs INTO g_stbc_d[l_ac].stbc001,g_stbc_d[l_ac].stbc002,g_stbc_d[l_ac].stbc003,g_stbc_d[l_ac].stbc004, 
       g_stbc_d[l_ac].stbc005,g_stbc_d[l_ac].stbc006,g_stbc_d[l_ac].stbc007,g_stbc_d[l_ac].stbc028,g_stbc_d[l_ac].stbc045, 
       g_stbc_d[l_ac].stbc046,g_stbc_d[l_ac].stbcsite,g_stbc_d[l_ac].stbc026,g_stbc_d[l_ac].stbc025, 
       g_stbc_d[l_ac].stbc027,g_stbc_d[l_ac].stbc008,g_stbc_d[l_ac].stbc029,g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009, 
       g_stbc_d[l_ac].stbc010,g_stbc_d[l_ac].stbc011,g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037,g_stbc_d[l_ac].stbc038, 
       g_stbc_d[l_ac].stbc058,g_stbc_d[l_ac].stbc013,g_stbc_d[l_ac].stbc014,g_stbc_d[l_ac].stbc015,g_stbc_d[l_ac].stbc016, 
       g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018,g_stbc_d[l_ac].stbc019,g_stbc_d[l_ac].stbc020,g_stbc_d[l_ac].stbc021, 
       g_stbc_d[l_ac].stbc022,g_stbc_d[l_ac].stbc023,g_stbc_d[l_ac].stbc024,g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057, 
       g_stbc_d[l_ac].stbc035,g_stbc_d[l_ac].stbc036,g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc040,g_stbc_d[l_ac].stbc042, 
       g_stbc_d[l_ac].stbc043,g_stbc_d[l_ac].stbc044,g_stbc_d[l_ac].stbcstus,g_stbc_d[l_ac].stbc001_desc, 
       g_stbc_d[l_ac].stbcsite_desc,g_stbc_d[l_ac].stbc008_desc,g_stbc_d[l_ac].stbc029_desc,g_stbc_d[l_ac].stbc010_desc, 
       g_stbc_d[l_ac].stbc011_desc,g_stbc_d[l_ac].stbc012_desc,g_stbc_d[l_ac].stbc013_desc
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH b_fill_curs:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
  
      #add-point:b_fill段資料填充 name="b_fill.fill"
      SELECT ooef019 INTO l_ooef019
        FROM ooef_t 
        WHERE ooefent = g_enterprise  AND ooef001 = g_site  
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = l_ooef019
      LET g_ref_fields[2] = g_stbc_d[l_ac].stbc014
      CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbc_d[l_ac].stbc014_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbc_d[l_ac].stbc014_desc
      #end add-point
      
      CALL astq330_detail_show()      
 
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code   = 9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
         END IF
         EXIT FOREACH
      END IF
 
      LET l_ac = l_ac + 1
      
   END FOREACH
 
   LET g_error_show = 0
   
 
   
   CALL g_stbc_d.deleteElement(g_stbc_d.getLength())   
 
   
   #將key欄位填到每個page
   FOR l_ac = 1 TO g_stbc_d.getLength()
 
      #add-point:b_fill段key值相關欄位 name="b_fill.keys.fill"
      
      #end add-point
   END FOR
   
   IF g_cnt > g_stbc_d.getLength() THEN
      LET l_ac = g_stbc_d.getLength()
   ELSE
      LET l_ac = g_cnt
   END IF
   LET g_cnt = l_ac
 
   #遮罩相關處理
   FOR l_ac = 1 TO g_stbc_d.getLength()
      LET g_stbc_d_mask_o[l_ac].* =  g_stbc_d[l_ac].*
      CALL astq330_stbc_t_mask()
      LET g_stbc_d_mask_n[l_ac].* =  g_stbc_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = g_cnt
 
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   #160627-00020#1 -s by 08172
   IF g_rcnt = 1 AND g_stbc_d.getLength() = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = ''
      LET g_errparam.code   = -100 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()   
   END IF  
   
   LET g_rcnt = 1
   #160627-00020#1 -e by 08172
   #end add-point
   
   ERROR "" 
 
   LET g_detail_cnt = g_stbc_d.getLength()
   DISPLAY g_detail_idx TO FORMONLY.idx
   DISPLAY g_detail_cnt TO FORMONLY.cnt
   
   CLOSE b_fill_curs
   FREE astq330_pb
   
END FUNCTION
 
{</section>}
 
{<section id="astq330.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq330_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point
   #add-point:show段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="detail_show.before"
   
   #end add-point
   
   
   
   #帶出公用欄位reference值page1
   #應用 a12 樣板自動產生(Version:4)
 
 
 
    
 
   
   #讀入ref值
   #add-point:show段單身reference name="detail_show.reference"
                      

   #end add-point
   
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq330.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astq330_set_entry_b(p_cmd)                                                  
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1         
   #add-point:set_entry_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   
   #end add-point
 
   IF p_cmd = "a" THEN
      CALL cl_set_comp_entry("",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry_b段欄位控制 name="set_entry_b.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_entry_b段control name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry("stbc037,stbc038",TRUE)
   #end add-point                                                                   
                                                                                
END FUNCTION                                                                 
 
{</section>}
 
{<section id="astq330.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astq330_set_no_entry_b(p_cmd)                                               
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point   
   DEFINE p_cmd   LIKE type_t.chr1           
   #add-point:set_no_entry_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_no_entry_b段control name="set_no_entry_b.set_no_entry_b"
   
   #只有纳入结算单否为Y，票扣否栏位开放  #add by geza20150705
   IF g_stbc_d[l_ac].stbc037 = 'N' THEN
      CALL cl_set_comp_entry("stbc038",FALSE)
   END IF
#  #只能改3.费用单的，其他类型的不能改
#  IF g_stbc_d[l_ac].stbc003 != '3' THEN
#     CALL cl_set_comp_entry("stbc037,stbc038",FALSE)
#  END IF
   #end add-point       
                                                                                
END FUNCTION
 
{</section>}
 
{<section id="astq330.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astq330_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point
   DEFINE li_idx  LIKE type_t.num10
   DEFINE li_cnt  LIKE type_t.num10
   DEFINE ls_wc   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="default_search.before"
   
   #end add-point  
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " stbc001 = '", g_argv[01], "' AND "
   END IF
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " stbc004 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET ls_wc = ls_wc, " stbc005 = '", g_argv[03], "' AND "
   END IF
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      LET ls_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_wc2 = ls_wc
   ELSE
      LET g_wc2 = " 1=1"
      #預設查詢條件
      LET g_wc2 = cl_qbe_get_default_qryplan()
      IF cl_null(g_wc2) THEN
         LET g_wc2 = " 1=1"
      END IF
   END IF
 
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astq330.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astq330_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   #判斷是否是同一群組的table
   LET ls_group = "stbc_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      IF ps_table <> 'stbc_t' THEN
         #add-point:delete_b段刪除前 name="delete_b.b_delete"
         
         #end add-point     
         
         DELETE FROM stbc_t
          WHERE stbcent = g_enterprise AND
            stbc001 = ps_keys_bak[1] AND stbc004 = ps_keys_bak[2] AND stbc005 = ps_keys_bak[3]
         
         #add-point:delete_b段刪除中 name="delete_b.m_delete"
         
         #end add-point  
            
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = ":",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = FALSE 
            CALL cl_err()
         END IF
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stbc_d.deleteElement(li_idx) 
      END IF 
 
      
      #add-point:delete_b段刪除後 name="delete_b.a_delete"
      
      #end add-point
      
      RETURN
   END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="astq330.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astq330_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   #add-point:insert_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   #判斷是否是同一群組的table
   LET ls_group = "stbc_t,"
   #IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      
      #add-point:insert_b段新增前 name="insert_b.b_insert"
      
      #end add-point    
      INSERT INTO stbc_t
                  (stbcent,
                   stbc001,stbc004,stbc005
                   ,stbc002,stbc003,stbc006,stbc007,stbc028,stbc045,stbc046,stbcsite,stbc026,stbc025,stbc027,stbc008,stbc029,stbc030,stbc009,stbc010,stbc011,stbc012,stbc037,stbc038,stbc058,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018,stbc019,stbc020,stbc021,stbc022,stbc023,stbc024,stbc034,stbc057,stbc035,stbc036,stbc039,stbc040,stbc042,stbc043,stbc044,stbcstus) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_stbc_d[l_ac].stbc002,g_stbc_d[l_ac].stbc003,g_stbc_d[l_ac].stbc006,g_stbc_d[l_ac].stbc007, 
                       g_stbc_d[l_ac].stbc028,g_stbc_d[l_ac].stbc045,g_stbc_d[l_ac].stbc046,g_stbc_d[l_ac].stbcsite, 
                       g_stbc_d[l_ac].stbc026,g_stbc_d[l_ac].stbc025,g_stbc_d[l_ac].stbc027,g_stbc_d[l_ac].stbc008, 
                       g_stbc_d[l_ac].stbc029,g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009,g_stbc_d[l_ac].stbc010, 
                       g_stbc_d[l_ac].stbc011,g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037,g_stbc_d[l_ac].stbc038, 
                       g_stbc_d[l_ac].stbc058,g_stbc_d[l_ac].stbc013,g_stbc_d[l_ac].stbc014,g_stbc_d[l_ac].stbc015, 
                       g_stbc_d[l_ac].stbc016,g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018,g_stbc_d[l_ac].stbc019, 
                       g_stbc_d[l_ac].stbc020,g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbc022,g_stbc_d[l_ac].stbc023, 
                       g_stbc_d[l_ac].stbc024,g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057,g_stbc_d[l_ac].stbc035, 
                       g_stbc_d[l_ac].stbc036,g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc040,g_stbc_d[l_ac].stbc042, 
                       g_stbc_d[l_ac].stbc043,g_stbc_d[l_ac].stbc044,g_stbc_d[l_ac].stbcstus)
      #add-point:insert_b段新增中 name="insert_b.m_insert"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      #add-point:insert_b段新增後 name="insert_b.a_insert"
      
      #end add-point    
   #END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="astq330.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astq330_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point
   DEFINE ps_page          STRING
   DEFINE ps_table         STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
   #比對新舊值, 判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #若key無變動, 不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
    
   #若key有變動, 則連動其他table的資料   
   #判斷是否是同一群組的table
   LET ls_group = "stbc_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 AND ps_table <> "stbc_t" THEN
      #add-point:update_b段修改前 name="update_b.b_update"
      
      #end add-point     
      UPDATE stbc_t 
         SET (stbc001,stbc004,stbc005
              ,stbc002,stbc003,stbc006,stbc007,stbc028,stbc045,stbc046,stbcsite,stbc026,stbc025,stbc027,stbc008,stbc029,stbc030,stbc009,stbc010,stbc011,stbc012,stbc037,stbc038,stbc058,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018,stbc019,stbc020,stbc021,stbc022,stbc023,stbc024,stbc034,stbc057,stbc035,stbc036,stbc039,stbc040,stbc042,stbc043,stbc044,stbcstus) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_stbc_d[l_ac].stbc002,g_stbc_d[l_ac].stbc003,g_stbc_d[l_ac].stbc006,g_stbc_d[l_ac].stbc007, 
                  g_stbc_d[l_ac].stbc028,g_stbc_d[l_ac].stbc045,g_stbc_d[l_ac].stbc046,g_stbc_d[l_ac].stbcsite, 
                  g_stbc_d[l_ac].stbc026,g_stbc_d[l_ac].stbc025,g_stbc_d[l_ac].stbc027,g_stbc_d[l_ac].stbc008, 
                  g_stbc_d[l_ac].stbc029,g_stbc_d[l_ac].stbc030,g_stbc_d[l_ac].stbc009,g_stbc_d[l_ac].stbc010, 
                  g_stbc_d[l_ac].stbc011,g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].stbc037,g_stbc_d[l_ac].stbc038, 
                  g_stbc_d[l_ac].stbc058,g_stbc_d[l_ac].stbc013,g_stbc_d[l_ac].stbc014,g_stbc_d[l_ac].stbc015, 
                  g_stbc_d[l_ac].stbc016,g_stbc_d[l_ac].stbc017,g_stbc_d[l_ac].stbc018,g_stbc_d[l_ac].stbc019, 
                  g_stbc_d[l_ac].stbc020,g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbc022,g_stbc_d[l_ac].stbc023, 
                  g_stbc_d[l_ac].stbc024,g_stbc_d[l_ac].stbc034,g_stbc_d[l_ac].stbc057,g_stbc_d[l_ac].stbc035, 
                  g_stbc_d[l_ac].stbc036,g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc040,g_stbc_d[l_ac].stbc042, 
                  g_stbc_d[l_ac].stbc043,g_stbc_d[l_ac].stbc044,g_stbc_d[l_ac].stbcstus) 
         WHERE stbcent = g_enterprise AND stbc001 = ps_keys_bak[1] AND stbc004 = ps_keys_bak[2] AND stbc005 = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point 
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            CALL s_transaction_end('N','0')
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbc_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbc_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
         OTHERWISE
            
      END CASE
      #add-point:update_b段修改後 name="update_b.a_update"
      
      #end add-point 
      RETURN
   END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="astq330.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astq330_lock_b(ps_table)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:lock_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
   
   #先刷新資料
   #CALL astq330_b_fill(g_wc2)
   
   #鎖定整組table
   #LET ls_group = ""
   #僅鎖定自身table
   LET ls_group = "stbc_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astq330_bcl USING g_enterprise,
                                       g_stbc_d[g_detail_idx].stbc001,g_stbc_d[g_detail_idx].stbc004, 
                                           g_stbc_d[g_detail_idx].stbc005
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astq330_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   
   END IF
                                    
 
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astq330.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astq330_unlock_b(ps_table)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:unlock_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
   
   LET ls_group = ""
   
   #IF ls_group.getIndexOf(ps_table,1) THEN
      CLOSE astq330_bcl
   #END IF
   
 
   
   #add-point:unlock_b段結束前 name="unlock_b.after"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astq330.modify_detail_chk" >}
#+ 單身輸入判定(因應modify_detail)
PRIVATE FUNCTION astq330_modify_detail_chk(ps_record)
   #add-point:modify_detail_chk段define(客製用) name="modify_detail_chk.define_customerization"
   
   #end add-point
   DEFINE ps_record STRING
   DEFINE ls_return STRING
   #add-point:modify_detail_chk段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify_detail_chk.define"
   
   #end add-point
   
   #add-point:modify_detail_chk段開始前 name="modify_detail_chk.before"
   
   #end add-point
   
   #根據sr名稱確定該page第一個欄位的名稱
   CASE ps_record
      WHEN "s_detail1" 
         LET ls_return = "stbc001"
 
      #add-point:modify_detail_chk段自訂page控制 name="modify_detail_chk.page_control"
      
      #end add-point
   END CASE
    
   #add-point:modify_detail_chk段結束前 name="modify_detail_chk.after"
   
   #end add-point
   
   RETURN ls_return
   
END FUNCTION
 
{</section>}
 
{<section id="astq330.show_ownid_msg" >}
#+ 判斷是否顯示只能修改自己權限資料的訊息
#(ver:35) ---add start---
PRIVATE FUNCTION astq330_show_ownid_msg()
   #add-point:show_ownid_msg段define(客製用) name="show_ownid_msg.define_customerization"
   
   #end add-point
   #add-point:show_ownid_msg段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show_ownid_msg.define"
   
   #end add-point
  
 
   
 
END FUNCTION
#(ver:35) --- add end ---
 
{</section>}
 
{<section id="astq330.mask_functions" >}
&include "erp/ast/astq330_mask.4gl"
 
{</section>}
 
{<section id="astq330.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astq330_set_pk_array()
   #add-point:set_pk_array段define name="set_pk_array.define_customerization"
   
   #end add-point
   #add-point:set_pk_array段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_pk_array.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="set_pk_array.before"
   
   #end add-point  
   
   #若l_ac<=0代表沒有資料
   IF l_ac <= 0 THEN
      RETURN
   END IF
   
   CALL g_pk_array.clear()
   LET g_pk_array[1].values = g_stbc_d[l_ac].stbc001
   LET g_pk_array[1].column = 'stbc001'
   LET g_pk_array[2].values = g_stbc_d[l_ac].stbc004
   LET g_pk_array[2].column = 'stbc004'
   LET g_pk_array[3].values = g_stbc_d[l_ac].stbc005
   LET g_pk_array[3].column = 'stbc005'
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astq330.state_change" >}
   
 
{</section>}
 
{<section id="astq330.other_dialog" readonly="Y" >}
 
 
{</section>}
 
{<section id="astq330.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 动态显示选择栏位
################################################################################
PRIVATE FUNCTION astq330_set_no_visible()
   DEFINE l_gzcb002 LIKE gzcb_t.gzcb002
   DEFINE l_gzcb007 LIKE gzcb_t.gzcb007
   DEFINE l_str STRING
   DEFINE l_str1 STRING
   LET l_str=''
   LET l_str1=''
   DECLARE sel_gzcb002 CURSOR FOR SELECT gzcb002 FROM gzcb_t WHERE gzcb001='6906' AND gzcb006="Y"
   FOREACH sel_gzcb002 INTO l_gzcb002
      IF cl_null(l_str) THEN
         LET l_str= l_gzcb002
      ELSE
         LET l_str=l_str,",",l_gzcb002
      END IF
   END FOREACH
   #LET l_str="'",l_str,",y'"
   CALL cl_set_combo_scc_part('combobox_1','6906',l_str)
   CALL cl_set_combo_scc_part('combobox_2','6906',l_str)
   CALL cl_set_combo_scc_part('combobox_3','6906',l_str)
   DECLARE sel_gzcb002_b CURSOR FOR SELECT gzcb007 FROM gzcb_t WHERE gzcb001='6906' AND gzcb006="N"
   FOREACH sel_gzcb002_b INTO l_gzcb007
      IF cl_null(l_str1) THEN
         LET l_str1= l_gzcb007
      ELSE
         LET l_str1=l_str1,",",l_gzcb007
      END IF
   END FOREACH
   #LET l_str1="'",l_str1,"'"
   CALL cl_set_comp_visible(l_str1,FALSE)
END FUNCTION

 
{</section>}
 
