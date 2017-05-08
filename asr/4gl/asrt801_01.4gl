#該程式未解開Section, 採用最新樣板產出!
{<section id="asrt801_01.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0002(2015-01-07 16:46:12), PR版次:0002(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000049
#+ Filename...: asrt801_01
#+ Description: 重複性生產製程多上站作業維護
#+ Creator....: 01258(2015-01-06 13:53:41)
#+ Modifier...: 01258 -SD/PR- 00000
 
{</section>}
 
{<section id="asrt801_01.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#Memos
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"

#end add-point 
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_srcc_m        RECORD
       srcc007 LIKE srcc_t.srcc007, 
   srcc008 LIKE srcc_t.srcc008, 
   srcc008_desc LIKE type_t.chr80, 
   srcc009 LIKE srcc_t.srcc009, 
   srcc001 LIKE srcc_t.srcc001, 
   srcc000 LIKE srcc_t.srcc000, 
   srcc002 LIKE srcc_t.srcc002, 
   srcc004 LIKE srcc_t.srcc004, 
   srcc900 LIKE srcc_t.srcc900, 
   srccsite LIKE srcc_t.srccsite, 
   srcc005 LIKE srcc_t.srcc005, 
   srcc006 LIKE srcc_t.srcc006
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_srce_d        RECORD
       srceseq LIKE srce_t.srceseq, 
   srce008 LIKE srce_t.srce008, 
   srce008_desc LIKE type_t.chr500, 
   srce009 LIKE srce_t.srce009, 
   srce901 LIKE srce_t.srce901, 
   srce902 LIKE srce_t.srce902, 
   srce905 LIKE srce_t.srce905, 
   srce905_desc LIKE type_t.chr500, 
   srce906 LIKE srce_t.srce906
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_srccsite LIKE srcc_t.srccsite,
      b_srcc000 LIKE srcc_t.srcc000,
      b_srcc001 LIKE srcc_t.srcc001,
      b_srcc002 LIKE srcc_t.srcc002,
      b_srcc004 LIKE srcc_t.srcc004,
      b_srcc005 LIKE srcc_t.srcc005,
      b_srcc006 LIKE srcc_t.srcc006,
      b_srcc007 LIKE srcc_t.srcc007,
      b_srcc900 LIKE srcc_t.srcc900
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_srcc000              LIKE srcc_t.srcc000
DEFINE g_srcc001              LIKE srcc_t.srcc001
DEFINE g_srcc002              LIKE srcc_t.srcc002
DEFINE g_srcc004              LIKE srcc_t.srcc004
DEFINE g_srcc005              LIKE srcc_t.srcc005
DEFINE g_srcc006              LIKE srcc_t.srcc006
DEFINE g_srcc007              LIKE srcc_t.srcc007
DEFINE g_srcc900              LIKE srcc_t.srcc900
DEFINE g_type                 LIKE type_t.chr1
DEFINE g_acc                  LIKE gzcb_t.gzcb007
DEFINE g_srce_d_color         DYNAMIC ARRAY OF RECORD
       srceseq                STRING,
       srce008                STRING,
       srce008_desc           STRING,
       srce009                STRING,
       srce901                STRING,
       srce902                STRING,
       srce905                STRING,
       srce905_desc           STRING,
       srce906                STRING
                              END RECORD
#end add-point
       
#模組變數(Module Variables)
DEFINE g_srcc_m          type_g_srcc_m
DEFINE g_srcc_m_t        type_g_srcc_m
DEFINE g_srcc_m_o        type_g_srcc_m
DEFINE g_srcc_m_mask_o   type_g_srcc_m #轉換遮罩前資料
DEFINE g_srcc_m_mask_n   type_g_srcc_m #轉換遮罩後資料
 
   DEFINE g_srcc007_t LIKE srcc_t.srcc007
DEFINE g_srcc001_t LIKE srcc_t.srcc001
DEFINE g_srcc000_t LIKE srcc_t.srcc000
DEFINE g_srcc002_t LIKE srcc_t.srcc002
DEFINE g_srcc004_t LIKE srcc_t.srcc004
DEFINE g_srcc900_t LIKE srcc_t.srcc900
DEFINE g_srccsite_t LIKE srcc_t.srccsite
DEFINE g_srcc005_t LIKE srcc_t.srcc005
DEFINE g_srcc006_t LIKE srcc_t.srcc006
 
 
DEFINE g_srce_d          DYNAMIC ARRAY OF type_g_srce_d
DEFINE g_srce_d_t        type_g_srce_d
DEFINE g_srce_d_o        type_g_srce_d
DEFINE g_srce_d_mask_o   DYNAMIC ARRAY OF type_g_srce_d #轉換遮罩前資料
DEFINE g_srce_d_mask_n   DYNAMIC ARRAY OF type_g_srce_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
 
 
DEFINE g_wc2_extend          STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
 
DEFINE g_sql                 STRING
DEFINE g_forupd_sql          STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE g_current_idx         LIKE type_t.num10     
DEFINE g_jump                LIKE type_t.num10        
DEFINE g_no_ask              LIKE type_t.num5        
DEFINE g_rec_b               LIKE type_t.num10           
DEFINE l_ac                  LIKE type_t.num10    
DEFINE g_curr_diag           ui.Dialog                         #Current Dialog
                                                               
DEFINE g_pagestart           LIKE type_t.num10                 
DEFINE gwin_curr             ui.Window                         #Current Window
DEFINE gfrm_curr             ui.Form                           #Current Form
DEFINE g_page_action         STRING                            #page action
DEFINE g_header_hidden       LIKE type_t.num5                  #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5                  #隱藏工作Panel
DEFINE g_page                STRING                            #第幾頁
DEFINE g_state               STRING       
DEFINE g_header_cnt          LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10                  #單身總筆數
DEFINE g_detail_idx          LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx_tmp      LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx2         LIKE type_t.num10                  #單身2目前所在筆數
DEFINE g_detail_idx_list     DYNAMIC ARRAY OF LIKE type_t.num10 #單身2目前所在筆數
DEFINE g_browser_cnt         LIKE type_t.num10                  #Browser總筆數
DEFINE g_browser_idx         LIKE type_t.num10                  #Browser目前所在筆數
DEFINE g_temp_idx            LIKE type_t.num10                  #Browser目前所在筆數(暫存用)
DEFINE g_order               STRING                             #查詢排序欄位
                                                        
DEFINE g_current_row         LIKE type_t.num10                  #Browser所在筆數
DEFINE g_current_sw          BOOLEAN                            #Browser所在筆數用開關
DEFINE g_current_page        LIKE type_t.num10                  #目前所在頁數
DEFINE g_insert              LIKE type_t.chr5                   #是否導到其他page
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys               DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak           DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_bfill               LIKE type_t.chr5              #是否刷新單身
DEFINE g_error_show          LIKE type_t.num5              #是否顯示筆數提示訊息
DEFINE g_master_insert       BOOLEAN                       #確認單頭資料是否寫入
 
DEFINE g_wc_frozen           STRING                        #凍結欄位使用
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_aw                  STRING                        #確定當下點擊的單身
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #log用
DEFINE g_log2                STRING                        #log用
DEFINE g_loc                 LIKE type_t.chr5              #判斷游標所在位置
DEFINE g_add_browse          STRING                        #新增填充用WC
DEFINE g_update              BOOLEAN                       #確定單頭/身是否異動過
DEFINE g_idx_group           om.SaxAttributes              #頁籤群組
DEFINE g_master_commit       LIKE type_t.chr1              #確認單頭是否修改過
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="asrt801_01.main" >}
#應用 a27 樣板自動產生(Version:6)
#+ 作業開始(子程式類型)
PUBLIC FUNCTION asrt801_01(--)
   #add-point:main段變數傳入 name="main.get_var"
   p_srcc000,p_srcc001,p_srcc002,p_srcc004,p_srcc005,p_srcc006,p_srcc007,p_srcc900,p_type
   #end add-point
   )
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE p_srcc000              LIKE srcc_t.srcc000
   DEFINE p_srcc001              LIKE srcc_t.srcc001
   DEFINE p_srcc002              LIKE srcc_t.srcc002
   DEFINE p_srcc004              LIKE srcc_t.srcc004
   DEFINE p_srcc005              LIKE srcc_t.srcc005
   DEFINE p_srcc006              LIKE srcc_t.srcc006
   DEFINE p_srcc007              LIKE srcc_t.srcc007
   DEFINE p_srcc900              LIKE srcc_t.srcc900
   DEFINE p_type                 LIKE type_t.chr1
   #end add-point   
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:作業初始化 name="main.init"
   LET g_srcc000 = p_srcc000
   LET g_srcc001 = p_srcc001
   LET g_srcc002 = p_srcc002
   LET g_srcc004 = p_srcc004
   LET g_srcc005 = p_srcc005
   LET g_srcc006 = p_srcc006
   LET g_srcc007 = p_srcc007
   LET g_srcc900 = p_srcc900
   LET g_type    = p_type
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = "SELECT srcc007,srcc008,'',srcc009,srcc001,srcc000,srcc002,srcc004,srcc900,srccsite, 
       srcc005,srcc006 FROM srcc_t WHERE srccent= ? AND srccsite=? AND srcc000=? AND srcc001=? AND srcc002=?  
       AND srcc004=? AND srcc005=? AND srcc006=? AND srcc007=? AND srcc900=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)   #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt801_01_cl CURSOR FROM g_forupd_sql     # LOCK CURSOR
 
   LET g_sql = " SELECT t0.srcc007,t0.srcc008,t0.srcc009,t0.srcc001,t0.srcc000,t0.srcc002,t0.srcc004, 
       t0.srcc900,t0.srccsite,t0.srcc005,t0.srcc006",
               " FROM srcc_t t0",
               " WHERE srccent = " ||g_enterprise|| " AND t0.srccsite = ? AND t0.srcc000 = ? AND t0.srcc001 = ? AND t0.srcc002 = ? AND t0.srcc004 = ? AND t0.srcc005 = ? AND t0.srcc006 = ? AND t0.srcc007 = ? AND t0.srcc900 = ?"
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE asrt801_01_master_referesh FROM g_sql
   
 
 
   
   #畫面開啟 (identifier)
   OPEN WINDOW w_asrt801_01 WITH FORM cl_ap_formpath("asr","asrt801_01")
   
   #瀏覽頁簽資料初始化
   CALL cl_ui_init()
   
   #程式初始化
   CALL asrt801_01_init()   
 
   #進入選單 Menu (="N")
   CALL asrt801_01_ui_dialog() 
 
   #畫面關閉
   CLOSE WINDOW w_asrt801_01
 
   CLOSE asrt801_01_cl
   
   
 
   #add-point:離開前 name="main.exit"
   LET g_action_choice=''
   #end add-point
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt801_01.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION asrt801_01_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
   
   
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc('srce901','5448')
   LET g_acc = ''
   #抓取[T:系統分類值檔].[C:系統分類碼]=24且[T:系統分類值檔].[C:系統分類碼]=g_prog 的[T:系統分類值檔].[C:參考欄位>
   SELECT gzcb004 INTO g_acc FROM gzcb_t WHERE gzcb001 = '24' AND gzcb002 = g_prog
   #end add-point
   
   #初始化搜尋條件
   CALL asrt801_01_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION asrt801_01_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE lb_first   BOOLEAN
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE la_param   RECORD
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
          END RECORD
   DEFINE ls_js      STRING
   DEFINE la_output  DYNAMIC ARRAY OF STRING   #報表元件鬆耦合使用
   DEFINE  l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE  l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE  l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_arg             STRING                 #報表作業cmdrun使用
   #add-point:ui_dialog段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   CALL cl_set_act_visible("accept,cancel", FALSE)
 
   
   #action default動作
   
   
   LET lb_first = TRUE
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   CALL asrt801_01_srcc_show()
   CALL asrt801_01_b_fill()
   IF g_type = 'N' THEN
      DISPLAY ARRAY g_srce_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) 
         ON ACTION accept
            LET INT_FLAG = TRUE
            EXIT DISPLAY

         ON ACTION cancel
            LET INT_FLAG = TRUE
            EXIT DISPLAY

         ON ACTION exit
           LET INT_FLAG = TRUE
           EXIT DISPLAY

         ON ACTION close
            LET INT_FLAG = TRUE
            EXIT DISPLAY
            
         BEFORE DISPLAY
            CALL DIALOG.setCellAttributes(g_srce_d_color)
            
         BEFORE ROW
            LET l_ac = DIALOG.getCurrentRow("s_detail1")
            LET g_detail_idx = l_ac
            CALL s_asrt801_hint_show('srce_t','srae_t',g_srcc000,g_srcc001,g_srcc002,g_srcc004,g_srcc005,g_srcc006,g_srcc007,g_srce_d[g_detail_idx].srceseq,g_srcc900) 
      END DISPLAY
      IF INT_FLAG THEN
         LET INT_FLAG = FALSE
         CLOSE WINDOW w_asrt801_01
         RETURN
      END IF
   END IF
   #end add-point
   
   WHILE TRUE 
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_srcc_m.* TO NULL
         CALL g_srce_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL asrt801_01_init()
      END IF
   
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
    
         DISPLAY ARRAY g_srce_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt801_01_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
               CALL s_asrt801_hint_show('srce_t','srae_t',g_srcc000,g_srcc001,g_srcc002,g_srcc004,g_srcc005,g_srcc006,g_srcc007,g_srce_d[g_detail_idx].srceseq,g_srcc900) 
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               #顯示單身筆數
               CALL asrt801_01_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               CALL DIALOG.setCellAttributes(g_srce_d_color)
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
      
         BEFORE DIALOG
            #先填充browser資料
            CALL asrt801_01_browser_fill("")
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            
            #確保g_current_idx位於正常區間內
            #小於,等於0則指到第1筆
            IF g_current_idx <= 0 THEN
               LET g_current_idx = 1
            END IF
            #超過最大筆數則指到最後1筆
            IF g_current_idx > g_browser.getLength() THEN
               LEt g_current_idx = g_browser.getLength()
            END IF 
            
            LET g_current_sw = TRUE
            LET g_current_row = g_current_idx #目前指標
            
            #有資料才進行fetch
            IF g_current_idx <> 0 THEN
               CALL asrt801_01_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL asrt801_01_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL asrt801_01_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            CALL asrt801_01_srcc_show()
            CALL asrt801_01_b_fill()
            IF g_type = 'Y' THEN
               CALL asrt801_01_input('')
               CALL asrt801_01_b_fill()
            END IF       
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
 
 
         
          
         #查詢方案選擇 
         ON ACTION queryplansel
            CALL cl_dlg_qryplan_select() RETURNING ls_wc
            #不是空條件才寫入g_wc跟重新找資料
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "srcc_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "srce_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL asrt801_01_browser_fill("F")   #browser_fill()會將notice區塊清空
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "srcc_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "srce_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL asrt801_01_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL asrt801_01_fetch("F")
                  END IF
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
          
         
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL asrt801_01_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt801_01_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL asrt801_01_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt801_01_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL asrt801_01_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt801_01_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL asrt801_01_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt801_01_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL asrt801_01_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt801_01_idx_chk()
          
         #excel匯出功能          
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #browser
               CALL g_export_node.clear()
               IF g_main_hidden = 1 THEN
                  LET g_export_node[1] = base.typeInfo.create(g_browser)
                  LET g_export_id[1]   = "s_browse"
                  CALL cl_export_to_excel()
               #非browser
               ELSE
                  LET g_export_node[1] = base.typeInfo.create(g_srce_d)
                  LET g_export_id[1]   = "s_detail1"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  
                  #END add-point
                  CALL cl_export_to_excel_getpage()
                  CALL cl_export_to_excel()
               END IF
            END IF
        
         ON ACTION close
            LET INT_FLAG = FALSE
            LET g_action_choice = "exit"
            EXIT DIALOG
          
         ON ACTION exit
            LET g_action_choice = "exit"
            EXIT DIALOG
    
         #主頁摺疊
         ON ACTION mainhidden       
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
               CALL cl_notice()
            END IF
            
       
         #單頭摺疊，可利用hot key "Alt-s"開啟/關閉單頭
         ON ACTION controls     
            IF g_header_hidden THEN
               CALL gfrm_curr.setElementHidden("vb_master",0)
               CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
               LET g_header_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("vb_master",1)
               CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
               LET g_header_hidden = 1     #hidden     
            END IF
    
         
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL asrt801_01_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL asrt801_01_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL asrt801_01_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
         
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
    
         #交談指令共用ACTION
         &include "common_action.4gl" 
            CONTINUE DIALOG
      END DIALOG
 
      #(ver:79) ---add start---
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      #(ver:79) --- add end ---
    
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
    
   END WHILE    
      
   CALL cl_set_act_visible("accept,cancel", TRUE)
    
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION asrt801_01_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   
   #end add-point
   
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
 
   #add-point:browser_fill,foreach前 name="browser_fill.before_foreach"
   
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT srccsite,srcc000,srcc001,srcc002,srcc004,srcc005,srcc006,srcc007, 
          srcc900 ",
                      " FROM srcc_t ",
                      " ",
                      " LEFT JOIN srce_t ON srceent = srccent AND srccsite = srcesite AND srcc000 = srce000 AND srcc001 = srce001 AND srcc002 = srce002 AND srcc004 = srce004 AND srcc005 = srce005 AND srcc006 = srce006 AND srcc007 = srce007 AND srcc900 = srce900 ", "  ",
                      #add-point:browser_fill段sql(srce_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE srccent = " ||g_enterprise|| " AND srceent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("srcc_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT srccsite,srcc000,srcc001,srcc002,srcc004,srcc005,srcc006,srcc007, 
          srcc900 ",
                      " FROM srcc_t ", 
                      "  ",
                      "  ",
                      " WHERE srccent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("srcc_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   
   #end add-point
   
   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"
   
   #add-point:browser_fill,count前 name="browser_fill.before_count"
   
   #end add-point
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt   #總筆數
      FREE header_cnt_pre
   END IF
    
   IF g_browser_cnt > g_max_browse THEN
      IF g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_browser_cnt
         LET g_errparam.code = 9035 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
      END IF
      LET g_browser_cnt = g_max_browse
   END IF
   
   DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
   DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
 
   #根據行為確定資料填充位置及WC
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM                
      INITIALIZE g_srcc_m.* TO NULL
      CALL g_srce_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.srccsite,t0.srcc000,t0.srcc001,t0.srcc002,t0.srcc004,t0.srcc005,t0.srcc006,t0.srcc007,t0.srcc900 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT '',t0.srccsite,t0.srcc000,t0.srcc001,t0.srcc002,t0.srcc004,t0.srcc005, 
          t0.srcc006,t0.srcc007,t0.srcc900 ",
                  " FROM srcc_t t0",
                  "  ",
                  "  LEFT JOIN srce_t ON srceent = srccent AND srccsite = srcesite AND srcc000 = srce000 AND srcc001 = srce001 AND srcc002 = srce002 AND srcc004 = srce004 AND srcc005 = srce005 AND srcc006 = srce006 AND srcc007 = srce007 AND srcc900 = srce900 ", "  ", 
                  #add-point:browser_fill段sql(srce_t1) name="browser_fill.join.srce_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                  
                  " WHERE t0.srccent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("srcc_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT '',t0.srccsite,t0.srcc000,t0.srcc001,t0.srcc002,t0.srcc004,t0.srcc005, 
          t0.srcc006,t0.srcc007,t0.srcc900 ",
                  " FROM srcc_t t0",
                  "  ",
                  
                  " WHERE t0.srccent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("srcc_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY srccsite,srcc000,srcc001,srcc002,srcc004,srcc005,srcc006,srcc007,srcc900 ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"srcc_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_srccsite,g_browser[g_cnt].b_srcc000, 
          g_browser[g_cnt].b_srcc001,g_browser[g_cnt].b_srcc002,g_browser[g_cnt].b_srcc004,g_browser[g_cnt].b_srcc005, 
          g_browser[g_cnt].b_srcc006,g_browser[g_cnt].b_srcc007,g_browser[g_cnt].b_srcc900
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
         
         #end add-point
      
      
         
         LET g_cnt = g_cnt + 1
         IF g_cnt > g_max_browse THEN
            EXIT FOREACH
         END IF
         
      END FOREACH
      FREE browse_pre
   END IF
   
   #清空g_add_browse, 並指定指標位置
   IF NOT cl_null(g_add_browse) THEN
      LET g_add_browse = ""
      CALL g_curr_diag.setCurrentRow("s_browse",g_current_idx)
   END IF
   
   IF cl_null(g_browser[g_cnt].b_srccsite) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF
   
   LET g_header_cnt  = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()
   
   #筆數顯示
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
      DISPLAY g_detail_idx  TO FORMONLY.idx     #單身當下筆數
      DISPLAY g_detail_cnt  TO FORMONLY.cnt     #單身總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
      DISPLAY '' TO FORMONLY.idx     #單身當下筆數
      DISPLAY '' TO FORMONLY.cnt     #單身總筆數
   END IF
 
   LET g_rec_b = g_cnt - 1
   LET g_detail_cnt = g_rec_b
   LET g_cnt = 0
 
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
                  
   
   #add-point:browser_fill段結束前 name="browser_fill.after"
   
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION asrt801_01_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_srcc_m.srccsite = g_browser[g_current_idx].b_srccsite   
   LET g_srcc_m.srcc000 = g_browser[g_current_idx].b_srcc000   
   LET g_srcc_m.srcc001 = g_browser[g_current_idx].b_srcc001   
   LET g_srcc_m.srcc002 = g_browser[g_current_idx].b_srcc002   
   LET g_srcc_m.srcc004 = g_browser[g_current_idx].b_srcc004   
   LET g_srcc_m.srcc005 = g_browser[g_current_idx].b_srcc005   
   LET g_srcc_m.srcc006 = g_browser[g_current_idx].b_srcc006   
   LET g_srcc_m.srcc007 = g_browser[g_current_idx].b_srcc007   
   LET g_srcc_m.srcc900 = g_browser[g_current_idx].b_srcc900   
 
   EXECUTE asrt801_01_master_referesh USING g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002, 
       g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900 INTO g_srcc_m.srcc007, 
       g_srcc_m.srcc008,g_srcc_m.srcc009,g_srcc_m.srcc001,g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004, 
       g_srcc_m.srcc900,g_srcc_m.srccsite,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc008_desc
   
   CALL asrt801_01_srcc_t_mask()
   CALL asrt801_01_show()
      
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION asrt801_01_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION asrt801_01_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"
   
   #end add-point    
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"
   
   #end add-point
   
   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_srccsite = g_srcc_m.srccsite 
         AND g_browser[l_i].b_srcc000 = g_srcc_m.srcc000 
         AND g_browser[l_i].b_srcc001 = g_srcc_m.srcc001 
         AND g_browser[l_i].b_srcc002 = g_srcc_m.srcc002 
         AND g_browser[l_i].b_srcc004 = g_srcc_m.srcc004 
         AND g_browser[l_i].b_srcc005 = g_srcc_m.srcc005 
         AND g_browser[l_i].b_srcc006 = g_srcc_m.srcc006 
         AND g_browser[l_i].b_srcc007 = g_srcc_m.srcc007 
         AND g_browser[l_i].b_srcc900 = g_srcc_m.srcc900 
 
         THEN
         CALL g_browser.deleteElement(l_i)
         EXIT FOR
      END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1
    
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
   
   #add-point:ui_browser_refresh段after name="ui_browser_refresh.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION asrt801_01_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point    
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING 
   DEFINE ls_wc       STRING 
   DEFINE la_wc       DYNAMIC ARRAY OF RECORD
          tableid     STRING,
          wc          STRING
          END RECORD
   DEFINE li_idx      LIKE type_t.num10
   #add-point:cs段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_srcc_m.* TO NULL
   CALL g_srce_d.clear()        
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON srcc007,srcc008,srcc009
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         
            
         #一般欄位開窗相關處理    
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srcc007
            #add-point:BEFORE FIELD srcc007 name="construct.b.srcc007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srcc007
            
            #add-point:AFTER FIELD srcc007 name="construct.a.srcc007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.srcc007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srcc007
            #add-point:ON ACTION controlp INFIELD srcc007 name="construct.c.srcc007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srcc008
            #add-point:BEFORE FIELD srcc008 name="construct.b.srcc008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srcc008
            
            #add-point:AFTER FIELD srcc008 name="construct.a.srcc008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.srcc008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srcc008
            #add-point:ON ACTION controlp INFIELD srcc008 name="construct.c.srcc008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srcc009
            #add-point:BEFORE FIELD srcc009 name="construct.b.srcc009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srcc009
            
            #add-point:AFTER FIELD srcc009 name="construct.a.srcc009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.srcc009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srcc009
            #add-point:ON ACTION controlp INFIELD srcc009 name="construct.c.srcc009"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON srce008,srce009,srce901,srce902,srce905,srce906
           FROM s_detail1[1].srce008,s_detail1[1].srce009,s_detail1[1].srce901,s_detail1[1].srce902, 
               s_detail1[1].srce905,s_detail1[1].srce906
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #Ctrlp:construct.c.page1.srce008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce008
            #add-point:ON ACTION controlp INFIELD srce008 name="construct.c.page1.srce008"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO srce008  #顯示到畫面上
            NEXT FIELD srce008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce008
            #add-point:BEFORE FIELD srce008 name="construct.b.page1.srce008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce008
            
            #add-point:AFTER FIELD srce008 name="construct.a.page1.srce008"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce009
            #add-point:BEFORE FIELD srce009 name="construct.b.page1.srce009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce009
            
            #add-point:AFTER FIELD srce009 name="construct.a.page1.srce009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.srce009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce009
            #add-point:ON ACTION controlp INFIELD srce009 name="construct.c.page1.srce009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce901
            #add-point:BEFORE FIELD srce901 name="construct.b.page1.srce901"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce901
            
            #add-point:AFTER FIELD srce901 name="construct.a.page1.srce901"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.srce901
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce901
            #add-point:ON ACTION controlp INFIELD srce901 name="construct.c.page1.srce901"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce902
            #add-point:BEFORE FIELD srce902 name="construct.b.page1.srce902"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce902
            
            #add-point:AFTER FIELD srce902 name="construct.a.page1.srce902"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.srce902
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce902
            #add-point:ON ACTION controlp INFIELD srce902 name="construct.c.page1.srce902"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce905
            #add-point:BEFORE FIELD srce905 name="construct.b.page1.srce905"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce905
            
            #add-point:AFTER FIELD srce905 name="construct.a.page1.srce905"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.srce905
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce905
            #add-point:ON ACTION controlp INFIELD srce905 name="construct.c.page1.srce905"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce906
            #add-point:BEFORE FIELD srce906 name="construct.b.page1.srce906"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce906
            
            #add-point:AFTER FIELD srce906 name="construct.a.page1.srce906"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.srce906
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce906
            #add-point:ON ACTION controlp INFIELD srce906 name="construct.c.page1.srce906"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         
         #end add-point  
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc, g_wc2, g_wc2_table1, g_wc2_extend TO NULL
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "srcc_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "srce_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
 
               END CASE
            END FOR
         END IF
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   END DIALOG
   
   #組合g_wc2
   LET g_wc2 = g_wc2_table1
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION asrt801_01_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   #切換畫面
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_srce_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL asrt801_01_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL asrt801_01_browser_fill("")
      CALL asrt801_01_fetch("")
      RETURN
   END IF
   
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||") AND ("||g_wc2||")")
   
   #搜尋後資料初始化 
   LET g_detail_cnt  = 0
   LET g_current_idx = 1
   LET g_current_row = 0
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_detail_idx_list[1] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
   CALL asrt801_01_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL asrt801_01_fetch("F") 
      #顯示單身筆數
      CALL asrt801_01_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION asrt801_01_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point    
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="fetch.pre_function"
   
   #end add-point
   
   IF g_browser_cnt = 0 THEN
      RETURN
   END IF
 
   #清空第二階單身
 
   
   CALL cl_ap_performance_next_start()
   CASE p_flag
      WHEN 'F' 
         LET g_current_idx = 1
      WHEN 'L'  
         LET g_current_idx = g_browser.getLength()              
      WHEN 'P'
         IF g_current_idx > 1 THEN               
            LET g_current_idx = g_current_idx - 1
         END IF 
      WHEN 'N'
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF        
      WHEN '/'
         IF (NOT g_no_ask) THEN    
            CALL cl_set_act_visible("accept,cancel", TRUE)    
            CALL cl_getmsg('fetch',g_lang) RETURNING ls_msg
            LET INT_FLAG = 0
 
            PROMPT ls_msg CLIPPED,':' FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl" 
            END PROMPT
 
            CALL cl_set_act_visible("accept,cancel", FALSE)    
            IF INT_FLAG THEN
                LET INT_FLAG = 0
                EXIT CASE  
            END IF           
         END IF
         
         IF g_jump > 0 AND g_jump <= g_browser.getLength() THEN
             LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE  
   END CASE 
 
   
   LET g_current_row = g_current_idx
   LET g_detail_cnt = g_header_cnt                  
   
   #單身總筆數顯示
   IF g_detail_cnt > 0 THEN
      #若單身有資料時, idx至少為1
      IF g_detail_idx <= 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx  
   ELSE
      LET g_detail_idx = 0
      DISPLAY '' TO FORMONLY.idx    
   END IF
   
   #瀏覽頁筆數顯示
   LET g_pagestart = g_current_idx
   DISPLAY g_pagestart TO FORMONLY.b_index   #當下筆數
   DISPLAY g_pagestart TO FORMONLY.h_index   #當下筆數
   
   CALL cl_navigator_setting( g_pagestart, g_browser_cnt )
 
   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_srcc_m.srccsite = g_browser[g_current_idx].b_srccsite
   LET g_srcc_m.srcc000 = g_browser[g_current_idx].b_srcc000
   LET g_srcc_m.srcc001 = g_browser[g_current_idx].b_srcc001
   LET g_srcc_m.srcc002 = g_browser[g_current_idx].b_srcc002
   LET g_srcc_m.srcc004 = g_browser[g_current_idx].b_srcc004
   LET g_srcc_m.srcc005 = g_browser[g_current_idx].b_srcc005
   LET g_srcc_m.srcc006 = g_browser[g_current_idx].b_srcc006
   LET g_srcc_m.srcc007 = g_browser[g_current_idx].b_srcc007
   LET g_srcc_m.srcc900 = g_browser[g_current_idx].b_srcc900
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE asrt801_01_master_referesh USING g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002, 
       g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900 INTO g_srcc_m.srcc007, 
       g_srcc_m.srcc008,g_srcc_m.srcc009,g_srcc_m.srcc001,g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004, 
       g_srcc_m.srcc900,g_srcc_m.srccsite,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc008_desc
   
   #遮罩相關處理
   LET g_srcc_m_mask_o.* =  g_srcc_m.*
   CALL asrt801_01_srcc_t_mask()
   LET g_srcc_m_mask_n.* =  g_srcc_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt801_01_set_act_visible()   
   CALL asrt801_01_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_srcc_m_t.* = g_srcc_m.*
   LET g_srcc_m_o.* = g_srcc_m.*
   
   
   #重新顯示   
   CALL asrt801_01_show()
 
   
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.insert" >}
#+ 資料新增
PRIVATE FUNCTION asrt801_01_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_srce_d.clear()   
 
 
   INITIALIZE g_srcc_m.* TO NULL             #DEFAULT 設定
   
   LET g_srccsite_t = NULL
   LET g_srcc000_t = NULL
   LET g_srcc001_t = NULL
   LET g_srcc002_t = NULL
   LET g_srcc004_t = NULL
   LET g_srcc005_t = NULL
   LET g_srcc006_t = NULL
   LET g_srcc007_t = NULL
   LET g_srcc900_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_srcc_m_t.* = g_srcc_m.*
      LET g_srcc_m_o.* = g_srcc_m.*
      
      #顯示狀態(stus)圖片
      
    
      CALL asrt801_01_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      IF NOT g_master_insert THEN
         DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
         INITIALIZE g_srcc_m.* TO NULL
         INITIALIZE g_srce_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL asrt801_01_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_srce_d.clear()
 
 
      LET g_rec_b = 0
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt801_01_set_act_visible()   
   CALL asrt801_01_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_srccsite_t = g_srcc_m.srccsite
   LET g_srcc000_t = g_srcc_m.srcc000
   LET g_srcc001_t = g_srcc_m.srcc001
   LET g_srcc002_t = g_srcc_m.srcc002
   LET g_srcc004_t = g_srcc_m.srcc004
   LET g_srcc005_t = g_srcc_m.srcc005
   LET g_srcc006_t = g_srcc_m.srcc006
   LET g_srcc007_t = g_srcc_m.srcc007
   LET g_srcc900_t = g_srcc_m.srcc900
 
   
   #組合新增資料的條件
   LET g_add_browse = " srccent = " ||g_enterprise|| " AND",
                      " srccsite = '", g_srcc_m.srccsite, "' "
                      ," AND srcc000 = '", g_srcc_m.srcc000, "' "
                      ," AND srcc001 = '", g_srcc_m.srcc001, "' "
                      ," AND srcc002 = '", g_srcc_m.srcc002, "' "
                      ," AND srcc004 = '", g_srcc_m.srcc004, "' "
                      ," AND srcc005 = '", g_srcc_m.srcc005, "' "
                      ," AND srcc006 = '", g_srcc_m.srcc006, "' "
                      ," AND srcc007 = '", g_srcc_m.srcc007, "' "
                      ," AND srcc900 = '", g_srcc_m.srcc900, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt801_01_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE asrt801_01_cl
   
   CALL asrt801_01_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE asrt801_01_master_referesh USING g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002, 
       g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900 INTO g_srcc_m.srcc007, 
       g_srcc_m.srcc008,g_srcc_m.srcc009,g_srcc_m.srcc001,g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004, 
       g_srcc_m.srcc900,g_srcc_m.srccsite,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc008_desc
   
   
   #遮罩相關處理
   LET g_srcc_m_mask_o.* =  g_srcc_m.*
   CALL asrt801_01_srcc_t_mask()
   LET g_srcc_m_mask_n.* =  g_srcc_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_srcc_m.srcc007,g_srcc_m.srcc008,g_srcc_m.srcc008_desc,g_srcc_m.srcc009,g_srcc_m.srcc001, 
       g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc900,g_srcc_m.srccsite,g_srcc_m.srcc005, 
       g_srcc_m.srcc006
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   
   #功能已完成,通報訊息中心
   CALL asrt801_01_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.modify" >}
#+ 資料修改
PRIVATE FUNCTION asrt801_01_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_srcc_m_t.* = g_srcc_m.*
   LET g_srcc_m_o.* = g_srcc_m.*
   
   IF g_srcc_m.srccsite IS NULL
   OR g_srcc_m.srcc000 IS NULL
   OR g_srcc_m.srcc001 IS NULL
   OR g_srcc_m.srcc002 IS NULL
   OR g_srcc_m.srcc004 IS NULL
   OR g_srcc_m.srcc005 IS NULL
   OR g_srcc_m.srcc006 IS NULL
   OR g_srcc_m.srcc007 IS NULL
   OR g_srcc_m.srcc900 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_srccsite_t = g_srcc_m.srccsite
   LET g_srcc000_t = g_srcc_m.srcc000
   LET g_srcc001_t = g_srcc_m.srcc001
   LET g_srcc002_t = g_srcc_m.srcc002
   LET g_srcc004_t = g_srcc_m.srcc004
   LET g_srcc005_t = g_srcc_m.srcc005
   LET g_srcc006_t = g_srcc_m.srcc006
   LET g_srcc007_t = g_srcc_m.srcc007
   LET g_srcc900_t = g_srcc_m.srcc900
 
   CALL s_transaction_begin()
   
   OPEN asrt801_01_cl USING g_enterprise,g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt801_01_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt801_01_cl
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt801_01_master_referesh USING g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002, 
       g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900 INTO g_srcc_m.srcc007, 
       g_srcc_m.srcc008,g_srcc_m.srcc009,g_srcc_m.srcc001,g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004, 
       g_srcc_m.srcc900,g_srcc_m.srccsite,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc008_desc
   
   #檢查是否允許此動作
   IF NOT asrt801_01_action_chk() THEN
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_srcc_m_mask_o.* =  g_srcc_m.*
   CALL asrt801_01_srcc_t_mask()
   LET g_srcc_m_mask_n.* =  g_srcc_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL asrt801_01_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_srccsite_t = g_srcc_m.srccsite
      LET g_srcc000_t = g_srcc_m.srcc000
      LET g_srcc001_t = g_srcc_m.srcc001
      LET g_srcc002_t = g_srcc_m.srcc002
      LET g_srcc004_t = g_srcc_m.srcc004
      LET g_srcc005_t = g_srcc_m.srcc005
      LET g_srcc006_t = g_srcc_m.srcc006
      LET g_srcc007_t = g_srcc_m.srcc007
      LET g_srcc900_t = g_srcc_m.srcc900
 
      
      #寫入修改者/修改日期資訊(單頭)
      
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL asrt801_01_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
 
    
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_srcc_m.* = g_srcc_m_t.*
            CALL asrt801_01_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_srcc_m.srccsite != g_srcc_m_t.srccsite
      OR g_srcc_m.srcc000 != g_srcc_m_t.srcc000
      OR g_srcc_m.srcc001 != g_srcc_m_t.srcc001
      OR g_srcc_m.srcc002 != g_srcc_m_t.srcc002
      OR g_srcc_m.srcc004 != g_srcc_m_t.srcc004
      OR g_srcc_m.srcc005 != g_srcc_m_t.srcc005
      OR g_srcc_m.srcc006 != g_srcc_m_t.srcc006
      OR g_srcc_m.srcc007 != g_srcc_m_t.srcc007
      OR g_srcc_m.srcc900 != g_srcc_m_t.srcc900
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE srce_t SET srcesite = g_srcc_m.srccsite
                                       ,srce000 = g_srcc_m.srcc000
                                       ,srce001 = g_srcc_m.srcc001
                                       ,srce002 = g_srcc_m.srcc002
                                       ,srce004 = g_srcc_m.srcc004
                                       ,srce005 = g_srcc_m.srcc005
                                       ,srce006 = g_srcc_m.srcc006
                                       ,srce007 = g_srcc_m.srcc007
                                       ,srce900 = g_srcc_m.srcc900
 
          WHERE srceent = g_enterprise AND srcesite = g_srcc_m_t.srccsite
            AND srce000 = g_srcc_m_t.srcc000
            AND srce001 = g_srcc_m_t.srcc001
            AND srce002 = g_srcc_m_t.srcc002
            AND srce004 = g_srcc_m_t.srcc004
            AND srce005 = g_srcc_m_t.srcc005
            AND srce006 = g_srcc_m_t.srcc006
            AND srce007 = g_srcc_m_t.srcc007
            AND srce900 = g_srcc_m_t.srcc900
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "srce_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "srce_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
 
         
 
         
         #UPDATE 多語言table key值
         
 
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt801_01_set_act_visible()   
   CALL asrt801_01_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " srccent = " ||g_enterprise|| " AND",
                      " srccsite = '", g_srcc_m.srccsite, "' "
                      ," AND srcc000 = '", g_srcc_m.srcc000, "' "
                      ," AND srcc001 = '", g_srcc_m.srcc001, "' "
                      ," AND srcc002 = '", g_srcc_m.srcc002, "' "
                      ," AND srcc004 = '", g_srcc_m.srcc004, "' "
                      ," AND srcc005 = '", g_srcc_m.srcc005, "' "
                      ," AND srcc006 = '", g_srcc_m.srcc006, "' "
                      ," AND srcc007 = '", g_srcc_m.srcc007, "' "
                      ," AND srcc900 = '", g_srcc_m.srcc900, "' "
 
   #填到對應位置
   CALL asrt801_01_browser_fill("")
 
   CLOSE asrt801_01_cl
   
 
   #功能已完成,通報訊息中心
   CALL asrt801_01_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="asrt801_01.input" >}
#+ 資料輸入
PRIVATE FUNCTION asrt801_01_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
   #end add-point  
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd_t               LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_n                   LIKE type_t.num10                #檢查重複用  
   DEFINE  l_cnt                 LIKE type_t.num10                #檢查重複用  
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否  
   DEFINE  l_count               LIKE type_t.num10
   DEFINE  l_i                   LIKE type_t.num10
   DEFINE  l_ac_t                LIKE type_t.num10
   DEFINE  l_insert              BOOLEAN
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num10
   DEFINE  li_reproduce_target   LIKE type_t.num10
   DEFINE  ls_keys               DYNAMIC ARRAY OF VARCHAR(500)
   #add-point:input段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_flag                LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理  name="input.pre_function"
   
   #end add-point
   
   #先做狀態判定
   IF p_cmd = 'r' THEN
      LET l_cmd_t = 'r'
      LET p_cmd   = 'a'
   ELSE
      LET l_cmd_t = p_cmd
   END IF   
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_srcc_m.srcc007,g_srcc_m.srcc008,g_srcc_m.srcc008_desc,g_srcc_m.srcc009,g_srcc_m.srcc001, 
       g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc900,g_srcc_m.srccsite,g_srcc_m.srcc005, 
       g_srcc_m.srcc006
   
   #切換畫面
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql name="input.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT srceseq,srce008,srce009,srce901,srce902,srce905,srce906 FROM srce_t WHERE  
       srceent=? AND srcesite=? AND srce000=? AND srce001=? AND srce002=? AND srce004=? AND srce005=?  
       AND srce006=? AND srce007=? AND srce900=? AND srceseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt801_01_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL asrt801_01_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL asrt801_01_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_srcc_m.srcc007,g_srcc_m.srcc008,g_srcc_m.srcc009
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   CALL asrt801_01_srcc_show()
   CALL asrt801_01_b_fill()
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="asrt801_01.input.head" >}
      #單頭段
      INPUT BY NAME g_srcc_m.srcc007,g_srcc_m.srcc008,g_srcc_m.srcc009 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            OPEN asrt801_01_cl USING g_enterprise,g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt801_01_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt801_01_cl
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL asrt801_01_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL asrt801_01_set_no_entry(p_cmd)
    
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srcc007
            #add-point:BEFORE FIELD srcc007 name="input.b.srcc007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srcc007
            
            #add-point:AFTER FIELD srcc007 name="input.a.srcc007"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  NOT cl_null(g_srcc_m.srccsite) AND NOT cl_null(g_srcc_m.srcc000) AND NOT cl_null(g_srcc_m.srcc001) AND NOT cl_null(g_srcc_m.srcc002) AND NOT cl_null(g_srcc_m.srcc004) AND NOT cl_null(g_srcc_m.srcc005) AND NOT cl_null(g_srcc_m.srcc006) AND NOT cl_null(g_srcc_m.srcc007) AND NOT cl_null(g_srcc_m.srcc900) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_srcc_m.srccsite != g_srccsite_t  OR g_srcc_m.srcc000 != g_srcc000_t  OR g_srcc_m.srcc001 != g_srcc001_t  OR g_srcc_m.srcc002 != g_srcc002_t  OR g_srcc_m.srcc004 != g_srcc004_t  OR g_srcc_m.srcc005 != g_srcc005_t  OR g_srcc_m.srcc006 != g_srcc006_t  OR g_srcc_m.srcc007 != g_srcc007_t  OR g_srcc_m.srcc900 != g_srcc900_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM srcc_t WHERE "||"srccent = '" ||g_enterprise|| "' AND "||"srccsite = '"||g_srcc_m.srccsite ||"' AND "|| "srcc000 = '"||g_srcc_m.srcc000 ||"' AND "|| "srcc001 = '"||g_srcc_m.srcc001 ||"' AND "|| "srcc002 = '"||g_srcc_m.srcc002 ||"' AND "|| "srcc004 = '"||g_srcc_m.srcc004 ||"' AND "|| "srcc005 = '"||g_srcc_m.srcc005 ||"' AND "|| "srcc006 = '"||g_srcc_m.srcc006 ||"' AND "|| "srcc007 = '"||g_srcc_m.srcc007 ||"' AND "|| "srcc900 = '"||g_srcc_m.srcc900 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srcc007
            #add-point:ON CHANGE srcc007 name="input.g.srcc007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srcc008
            
            #add-point:AFTER FIELD srcc008 name="input.a.srcc008"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_srcc_m.srcc008
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='225' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_srcc_m.srcc008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_srcc_m.srcc008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srcc008
            #add-point:BEFORE FIELD srcc008 name="input.b.srcc008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srcc008
            #add-point:ON CHANGE srcc008 name="input.g.srcc008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srcc009
            #add-point:BEFORE FIELD srcc009 name="input.b.srcc009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srcc009
            
            #add-point:AFTER FIELD srcc009 name="input.a.srcc009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srcc009
            #add-point:ON CHANGE srcc009 name="input.g.srcc009"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.srcc007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srcc007
            #add-point:ON ACTION controlp INFIELD srcc007 name="input.c.srcc007"
            
            #END add-point
 
 
         #Ctrlp:input.c.srcc008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srcc008
            #add-point:ON ACTION controlp INFIELD srcc008 name="input.c.srcc008"
            
            #END add-point
 
 
         #Ctrlp:input.c.srcc009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srcc009
            #add-point:ON ACTION controlp INFIELD srcc009 name="input.c.srcc009"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002,g_srcc_m.srcc004, 
                g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               
               #end add-point
               
               INSERT INTO srcc_t (srccent,srcc007,srcc008,srcc009,srcc001,srcc000,srcc002,srcc004,srcc900, 
                   srccsite,srcc005,srcc006)
               VALUES (g_enterprise,g_srcc_m.srcc007,g_srcc_m.srcc008,g_srcc_m.srcc009,g_srcc_m.srcc001, 
                   g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc900,g_srcc_m.srccsite, 
                   g_srcc_m.srcc005,g_srcc_m.srcc006) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_srcc_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL asrt801_01_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL asrt801_01_b_fill()
                  CALL asrt801_01_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL asrt801_01_srcc_t_mask_restore('restore_mask_o')
               
               UPDATE srcc_t SET (srcc007,srcc008,srcc009,srcc001,srcc000,srcc002,srcc004,srcc900,srccsite, 
                   srcc005,srcc006) = (g_srcc_m.srcc007,g_srcc_m.srcc008,g_srcc_m.srcc009,g_srcc_m.srcc001, 
                   g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc900,g_srcc_m.srccsite, 
                   g_srcc_m.srcc005,g_srcc_m.srcc006)
                WHERE srccent = g_enterprise AND srccsite = g_srccsite_t
                  AND srcc000 = g_srcc000_t
                  AND srcc001 = g_srcc001_t
                  AND srcc002 = g_srcc002_t
                  AND srcc004 = g_srcc004_t
                  AND srcc005 = g_srcc005_t
                  AND srcc006 = g_srcc006_t
                  AND srcc007 = g_srcc007_t
                  AND srcc900 = g_srcc900_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "srcc_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL asrt801_01_srcc_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_srcc_m_t)
               LET g_log2 = util.JSON.stringify(g_srcc_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
               ELSE
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_srccsite_t = g_srcc_m.srccsite
            LET g_srcc000_t = g_srcc_m.srcc000
            LET g_srcc001_t = g_srcc_m.srcc001
            LET g_srcc002_t = g_srcc_m.srcc002
            LET g_srcc004_t = g_srcc_m.srcc004
            LET g_srcc005_t = g_srcc_m.srcc005
            LET g_srcc006_t = g_srcc_m.srcc006
            LET g_srcc007_t = g_srcc_m.srcc007
            LET g_srcc900_t = g_srcc_m.srcc900
 
            
      END INPUT
   
 
{</section>}
 
{<section id="asrt801_01.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_srce_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_srce_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt801_01_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_srce_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[1] = l_ac
            LET g_current_page = 1
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN asrt801_01_cl USING g_enterprise,g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt801_01_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt801_01_cl
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_srce_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_srce_d[l_ac].srceseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_srce_d_t.* = g_srce_d[l_ac].*  #BACKUP
               LET g_srce_d_o.* = g_srce_d[l_ac].*  #BACKUP
               CALL asrt801_01_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL asrt801_01_set_no_entry_b(l_cmd)
               IF NOT asrt801_01_lock_b("srce_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt801_01_bcl INTO g_srce_d[l_ac].srceseq,g_srce_d[l_ac].srce008,g_srce_d[l_ac].srce009, 
                      g_srce_d[l_ac].srce901,g_srce_d[l_ac].srce902,g_srce_d[l_ac].srce905,g_srce_d[l_ac].srce906 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_srce_d_t.srceseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_srce_d_mask_o[l_ac].* =  g_srce_d[l_ac].*
                  CALL asrt801_01_srce_t_mask()
                  LET g_srce_d_mask_n[l_ac].* =  g_srce_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asrt801_01_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
        
         BEFORE INSERT  
            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_srce_d[l_ac].* TO NULL 
            INITIALIZE g_srce_d_t.* TO NULL 
            INITIALIZE g_srce_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_srce_d[l_ac].srce901 = "3"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            LET g_srce_d[l_ac].srce902 = cl_get_today()
            #end add-point
            LET g_srce_d_t.* = g_srce_d[l_ac].*     #新輸入資料
            LET g_srce_d_o.* = g_srce_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt801_01_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL asrt801_01_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_srce_d[li_reproduce_target].* = g_srce_d[li_reproduce].*
 
               LET g_srce_d[li_reproduce_target].srceseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            SELECT MAX(srceseq)+1 INTO g_srce_d[l_ac].srceseq FROM srce_t
             WHERE srceent = g_enterprise AND srcesite = g_site AND srce000 = g_srcc000
               AND srce001 = g_srcc001 AND srce002 = g_srcc002 AND srce004 = g_srcc004
               AND srce005 = g_srcc005 AND srce006 = g_srcc006 AND srce900 = g_srcc900
               AND srce007 = g_srcc007
            IF cl_null(g_srcE_d[l_ac].srceseq) THEN
               LET g_srcE_d[l_ac].srceseq = 1
            END IF
            #end add-point  
  
         AFTER INSERT
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身新增 name="input.body.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM srce_t 
             WHERE srceent = g_enterprise AND srcesite = g_srcc_m.srccsite
               AND srce000 = g_srcc_m.srcc000
               AND srce001 = g_srcc_m.srcc001
               AND srce002 = g_srcc_m.srcc002
               AND srce004 = g_srcc_m.srcc004
               AND srce005 = g_srcc_m.srcc005
               AND srce006 = g_srcc_m.srcc006
               AND srce007 = g_srcc_m.srcc007
               AND srce900 = g_srcc_m.srcc900
 
               AND srceseq = g_srce_d[l_ac].srceseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_srcc_m.srccsite
               LET gs_keys[2] = g_srcc_m.srcc000
               LET gs_keys[3] = g_srcc_m.srcc001
               LET gs_keys[4] = g_srcc_m.srcc002
               LET gs_keys[5] = g_srcc_m.srcc004
               LET gs_keys[6] = g_srcc_m.srcc005
               LET gs_keys[7] = g_srcc_m.srcc006
               LET gs_keys[8] = g_srcc_m.srcc007
               LET gs_keys[9] = g_srcc_m.srcc900
               LET gs_keys[10] = g_srce_d[g_detail_idx].srceseq
               CALL asrt801_01_insert_b('srce_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_srce_d[l_ac].* TO NULL
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "srce_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt801_01_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               IF NOT asrt801_upd_srce_srcf(g_srcc000,g_srcc001,g_srcc002,g_srcc004,g_srcc005,g_srcc006,g_srcc007,g_srce_d[l_ac].srceseq,g_srcc900) THEN 
                  INITIALIZE g_srce_d[l_ac].* TO NULL
                  CALL s_transaction_end('N','0')
                  CANCEL INSERT
               END IF
               #end add-point
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body.b_delete_ask"
               
               #end add-point 
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身刪除前 name="input.body.b_delete"
               IF g_srce_d[l_ac].srce901 = '4' THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = g_srce_d[l_ac].srce008
                  LET g_errparam.code   = 'aec-00037' 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err() 
                  CANCEL DELETE
               END IF
               
               IF NOT asrt801_srce_delete(g_srcc000,g_srcc001,g_srcc002,g_srcc004,g_srcc005,g_srcc006,g_srcc900,g_srcc007,g_srce_d[l_ac].srceseq) THEN
                  CALL s_transaction_end('N','0')
                  CANCEL DELETE
               END IF
               
               CALL s_transaction_end('Y','0')
               LET l_cmd = 'd'     #防止进入AFTER DELETE 继续删除单身资料
               IF 1 = 2 THEN
               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_srcc_m.srccsite
               LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc000
               LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc001
               LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc002
               LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc004
               LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc005
               LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc006
               LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc007
               LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc900
 
               LET gs_keys[gs_keys.getLength()+1] = g_srce_d_t.srceseq
 
            
               #刪除同層單身
               IF NOT asrt801_01_delete_b('srce_t',gs_keys,"'1'") THEN
                  CLOSE asrt801_01_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asrt801_01_key_delete_b(gs_keys,'srce_t') THEN
                  CLOSE asrt801_01_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CLOSE asrt801_01_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                  END IF
               #end add-point
               LET l_count = g_srce_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_srce_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce008
            
            #add-point:AFTER FIELD srce008 name="input.a.page1.srce008"
            CALL asrt801_01_srce_desc()
            IF NOT cl_null(g_srce_d[l_ac].srce008) AND NOT cl_null(g_srce_d[l_ac].srce009) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND ( l_cmd = 'u' AND (g_srce_d[l_ac].srce008 != g_srce_d_t.srce008 OR g_srce_d[l_ac].srce009 != g_srce_d_t.srce009))) THEN 
                  IF NOT ap_chk_notDup(g_srce_d[l_ac].srce008,"SELECT COUNT(*) FROM srce_t WHERE "||"srceent = '" ||g_enterprise|| "' AND "||"srcesite = '"||g_site ||"' AND "|| "srce000 = '"||g_srcc000 ||"' AND "|| "srce001 = '"||g_srcc001 ||"' AND "|| "srce002 = '"||g_srcc002 ||"' AND "|| "srce004 = '"||g_srcc004 ||"' AND "|| "srce005 = '"||g_srcc005 ||"' AND "|| "srce006 = '"||g_srcc006 ||"' AND "|| "srce007 = '"||g_srcc007 ||"' AND "|| "srce900 = '"||g_srcc900 ||"' AND "|| "srce008 = '"||g_srce_d[l_ac].srce008 ||"' AND "|| "srce009 = '"||g_srce_d[l_ac].srce009||"'",'std-00004',0) THEN 
                     LET g_srce_d[l_ac].srce008 = g_srce_d_t.srce008
                     CALL asrt801_01_srce_desc()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            IF g_srce_d[l_ac].srce008 = 'INIT' OR g_srce_d[l_ac].srce008 = 'MULT' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aec-00016'
               LET g_errparam.extend = g_srce_d[l_ac].srce008
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_srce_d[l_ac].srce008 = g_srce_d_t.srce008
               CALL asrt801_01_srce_desc()
               NEXT FIELD CURRENT
            END IF
            IF NOT cl_null(g_srce_d[l_ac].srce008) AND NOT cl_null(g_srce_d[l_ac].srce009) THEN
               CALL asrt801_01_chk_srce008(l_cmd)
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_srce_d[l_ac].srce008
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_srce_d[l_ac].srce008 = g_srce_d_t.srce008
                  CALL asrt801_01_srce_desc()
                  NEXT FIELD CURRENT
               END IF
               IF g_srce_d[l_ac].srce008 = g_srcc_m.srcc008 AND g_srce_d[l_ac].srce009 = g_srcc_m.srcc009 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aec-00008'
                  LET g_errparam.extend = g_srcc_m.srcc008
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_srce_d[l_ac].srce008 = g_srce_d_t.srce008
                  CALL asrt801_01_srce_desc()
                  NEXT FIELD CURRENT
               END IF
            END IF
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce008
            #add-point:BEFORE FIELD srce008 name="input.b.page1.srce008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srce008
            #add-point:ON CHANGE srce008 name="input.g.page1.srce008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce009
            #add-point:BEFORE FIELD srce009 name="input.b.page1.srce009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce009
            
            #add-point:AFTER FIELD srce009 name="input.a.page1.srce009"
            IF NOT cl_null(g_srce_d[l_ac].srce008) AND NOT cl_null(g_srce_d[l_ac].srce009) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND ( l_cmd = 'u' AND (g_srce_d[l_ac].srce008 != g_srce_d_t.srce008 OR g_srce_d[l_ac].srce009 != g_srce_d_t.srce009))) THEN 
                  IF NOT ap_chk_notDup(g_srce_d[l_ac].srce008,"SELECT COUNT(*) FROM srce_t WHERE "||"srceent = '" ||g_enterprise|| "' AND "||"srcesite = '"||g_site ||"' AND "|| "srce000 = '"||g_srcc000 ||"' AND "|| "srce001 = '"||g_srcc001 ||"' AND "|| "srce002 = '"||g_srcc002 ||"' AND "|| "srce004 = '"||g_srcc004 ||"' AND "|| "srce005 = '"||g_srcc005 ||"' AND "|| "srce006 = '"||g_srcc006 ||"' AND "|| "srce007 = '"||g_srcc007 ||"' AND "|| "srce900 = '"||g_srcc900 ||"' AND "|| "srce008 = '"||g_srce_d[l_ac].srce008 ||"' AND "|| "srce009 = '"||g_srce_d[l_ac].srce009||"'",'std-00004',0) THEN 
                     LET g_srce_d[l_ac].srce009 = g_srce_d_t.srce009
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            
            IF NOT cl_null(g_srce_d[l_ac].srce008) AND NOT cl_null(g_srce_d[l_ac].srce009) THEN
               CALL asrt801_01_chk_srce008(l_cmd)
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_srce_d[l_ac].srce009
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_srce_d[l_ac].srce009 = g_srce_d_t.srce009
                  NEXT FIELD CURRENT
               END IF
               IF g_srce_d[l_ac].srce008 = g_srcc_m.srcc008 AND g_srce_d[l_ac].srce009 = g_srcc_m.srcc009 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aec-00008'
                  LET g_errparam.extend = g_srcc_m.srcc009
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_srce_d[l_ac].srce009 = g_srce_d_t.srce009
                  NEXT FIELD CURRENT
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srce009
            #add-point:ON CHANGE srce009 name="input.g.page1.srce009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce901
            #add-point:BEFORE FIELD srce901 name="input.b.page1.srce901"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce901
            
            #add-point:AFTER FIELD srce901 name="input.a.page1.srce901"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srce901
            #add-point:ON CHANGE srce901 name="input.g.page1.srce901"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce902
            #add-point:BEFORE FIELD srce902 name="input.b.page1.srce902"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce902
            
            #add-point:AFTER FIELD srce902 name="input.a.page1.srce902"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srce902
            #add-point:ON CHANGE srce902 name="input.g.page1.srce902"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce905
            
            #add-point:AFTER FIELD srce905 name="input.a.page1.srce905"
            IF NOT cl_null(g_srce_d[l_ac].srce905) AND (g_srce_d[l_ac].srce905 != g_srce_d_t.srce905 OR cl_null(g_srce_d_t.srce905)) THEN
               IF NOT s_azzi650_chk_exist(g_acc,g_srce_d[l_ac].srce905) THEN
                  LET g_srce_d[l_ac].srce905 = g_srce_d_t.srce905
                  CALL asrt801_01_srce_desc()
                  NEXT FIELD srce905
               END IF
            END IF
            CALL asrt801_01_srce_desc()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce905
            #add-point:BEFORE FIELD srce905 name="input.b.page1.srce905"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srce905
            #add-point:ON CHANGE srce905 name="input.g.page1.srce905"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srce906
            #add-point:BEFORE FIELD srce906 name="input.b.page1.srce906"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srce906
            
            #add-point:AFTER FIELD srce906 name="input.a.page1.srce906"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srce906
            #add-point:ON CHANGE srce906 name="input.g.page1.srce906"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.srce008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce008
            #add-point:ON ACTION controlp INFIELD srce008 name="input.c.page1.srce008"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_srce_d[l_ac].srce008             #給予default值
            LET g_qryparam.default2 = g_srce_d[l_ac].srce009 
            #給予arg
            LET g_qryparam.arg1 = g_srcc000
            LET g_qryparam.arg2 = g_srcc001
            LET g_qryparam.arg3 = g_srcc002
            LET g_qryparam.arg4 = g_srcc004
            LET g_qryparam.arg5 = g_srcc005
            LET g_qryparam.arg6 = g_srcc006

            CALL q_srcc008()                                #呼叫開窗

            LET g_srce_d[l_ac].srce008 = g_qryparam.return1              
            LET g_srce_d[l_ac].srce009 = g_qryparam.return2 
            DISPLAY g_srce_d[l_ac].srce008 TO srce008              #
            DISPLAY g_srce_d[l_ac].srce009 TO srce009  #應用分類碼
            NEXT FIELD srce008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.srce009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce009
            #add-point:ON ACTION controlp INFIELD srce009 name="input.c.page1.srce009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srce901
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce901
            #add-point:ON ACTION controlp INFIELD srce901 name="input.c.page1.srce901"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srce902
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce902
            #add-point:ON ACTION controlp INFIELD srce902 name="input.c.page1.srce902"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srce905
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce905
            #add-point:ON ACTION controlp INFIELD srce905 name="input.c.page1.srce905"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_srce_d[l_ac].srce905             #給予default值
            LET g_qryparam.default2 = "" #g_srce_d[l_ac].oocq002 #應用分類碼
            #給予arg
            LET g_qryparam.arg1 = g_acc
            CALL q_oocq002()                                #呼叫開窗
            LET g_srce_d[l_ac].srce905 = g_qryparam.return1        
            DISPLAY g_srce_d[l_ac].srce905 TO srce905            
            NEXT FIELD srce905                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.srce906
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srce906
            #add-point:ON ACTION controlp INFIELD srce906 name="input.c.page1.srce906"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_srce_d[l_ac].* = g_srce_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt801_01_bcl
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_srce_d[l_ac].srceseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_srce_d[l_ac].* = g_srce_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               #add-point:單身修改前
               IF g_srce_d[l_ac].srce901 = '1' THEN
                  LET g_srce_d[l_ac].srce901 = '2'
               END IF
               LET g_srce_d[l_ac].srce902 = cl_get_today()
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL asrt801_01_srce_t_mask_restore('restore_mask_o')
      
               UPDATE srce_t SET (srcesite,srce000,srce001,srce002,srce004,srce005,srce006,srce007,srce900, 
                   srceseq,srce008,srce009,srce901,srce902,srce905,srce906) = (g_srcc_m.srccsite,g_srcc_m.srcc000, 
                   g_srcc_m.srcc001,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006, 
                   g_srcc_m.srcc007,g_srcc_m.srcc900,g_srce_d[l_ac].srceseq,g_srce_d[l_ac].srce008,g_srce_d[l_ac].srce009, 
                   g_srce_d[l_ac].srce901,g_srce_d[l_ac].srce902,g_srce_d[l_ac].srce905,g_srce_d[l_ac].srce906) 
 
                WHERE srceent = g_enterprise AND srcesite = g_srcc_m.srccsite 
                  AND srce000 = g_srcc_m.srcc000 
                  AND srce001 = g_srcc_m.srcc001 
                  AND srce002 = g_srcc_m.srcc002 
                  AND srce004 = g_srcc_m.srcc004 
                  AND srce005 = g_srcc_m.srcc005 
                  AND srce006 = g_srcc_m.srcc006 
                  AND srce007 = g_srcc_m.srcc007 
                  AND srce900 = g_srcc_m.srcc900 
 
                  AND srceseq = g_srce_d_t.srceseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_srce_d[l_ac].* = g_srce_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "srce_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_srce_d[l_ac].* = g_srce_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "srce_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_srcc_m.srccsite
               LET gs_keys_bak[1] = g_srccsite_t
               LET gs_keys[2] = g_srcc_m.srcc000
               LET gs_keys_bak[2] = g_srcc000_t
               LET gs_keys[3] = g_srcc_m.srcc001
               LET gs_keys_bak[3] = g_srcc001_t
               LET gs_keys[4] = g_srcc_m.srcc002
               LET gs_keys_bak[4] = g_srcc002_t
               LET gs_keys[5] = g_srcc_m.srcc004
               LET gs_keys_bak[5] = g_srcc004_t
               LET gs_keys[6] = g_srcc_m.srcc005
               LET gs_keys_bak[6] = g_srcc005_t
               LET gs_keys[7] = g_srcc_m.srcc006
               LET gs_keys_bak[7] = g_srcc006_t
               LET gs_keys[8] = g_srcc_m.srcc007
               LET gs_keys_bak[8] = g_srcc007_t
               LET gs_keys[9] = g_srcc_m.srcc900
               LET gs_keys_bak[9] = g_srcc900_t
               LET gs_keys[10] = g_srce_d[g_detail_idx].srceseq
               LET gs_keys_bak[10] = g_srce_d_t.srceseq
               CALL asrt801_01_update_b('srce_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL asrt801_01_srce_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_srce_d[g_detail_idx].srceseq = g_srce_d_t.srceseq 
 
                  ) THEN
                  LET gs_keys[01] = g_srcc_m.srccsite
                  LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc000
                  LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc001
                  LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc002
                  LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc004
                  LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc005
                  LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc006
                  LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc007
                  LET gs_keys[gs_keys.getLength()+1] = g_srcc_m.srcc900
 
                  LET gs_keys[gs_keys.getLength()+1] = g_srce_d_t.srceseq
 
                  CALL asrt801_01_key_update_b(gs_keys,'srce_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_srcc_m),util.JSON.stringify(g_srce_d_t)
               LET g_log2 = util.JSON.stringify(g_srcc_m),util.JSON.stringify(g_srce_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               IF NOT asrt801_upd_srce_srcf(g_srcc000,g_srcc001,g_srcc002,g_srcc004,g_srcc005,g_srcc006,g_srcc007,g_srce_d[l_ac].srceseq,g_srcc900) THEN 
                  LET g_srce_d[l_ac].* = g_srce_d_t.*
                  CALL s_transaction_end('N','0')
               END IF
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL asrt801_01_unlock_b("srce_t","'1'")
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_srce_d[li_reproduce_target].* = g_srce_d[li_reproduce].*
 
               LET g_srce_d[li_reproduce_target].srceseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_srce_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_srce_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="asrt801_01.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx)
         NEXT FIELD srce008
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD srccsite
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD srceseq
 
               #add-point:input段modify_detail  name="input.modify_detail.other"
               
               #end add-point  
            END CASE
         END IF
      
      AFTER DIALOG
         #add-point:input段after_dialog name="input.after_dialog"
         
         #end add-point    
         
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controls
         IF g_header_hidden THEN
            CALL gfrm_curr.setElementHidden("vb_master",0)
            CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
            LET g_header_hidden = 0     #visible
         ELSE
            CALL gfrm_curr.setElementHidden("vb_master",1)
            CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
            LET g_header_hidden = 1     #hidden     
         END IF
 
      ON ACTION accept
         #add-point:input段accept  name="input.accept"
         
         #end add-point    
         ACCEPT DIALOG
        
      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit        #toolbar 離開
         #add-point:input段exit name="input.exit"
         
         #end add-point
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION asrt801_01_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL asrt801_01_b_fill() #單身填充
      CALL asrt801_01_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL asrt801_01_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   CALL asrt801_01_srcc_show()
   CALL asrt801_01_b_fill()
   #end add-point
   
   #遮罩相關處理
   LET g_srcc_m_mask_o.* =  g_srcc_m.*
   CALL asrt801_01_srcc_t_mask()
   LET g_srcc_m_mask_n.* =  g_srcc_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_srcc_m.srcc007,g_srcc_m.srcc008,g_srcc_m.srcc008_desc,g_srcc_m.srcc009,g_srcc_m.srcc001, 
       g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc900,g_srcc_m.srccsite,g_srcc_m.srcc005, 
       g_srcc_m.srcc006
   
   #顯示狀態(stus)圖片
   
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_srce_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      CALL asrt801_01_srce_desc()
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL asrt801_01_detail_show()
 
   #add-point:show段之後 name="show.after"
   CALL asrt801_01_srcc_color()
   CALL s_asrt801_hint_show('srcc_t','srac_t',g_srcc000,g_srcc001,g_srcc002,g_srcc004,g_srcc005,g_srcc006,g_srcc007,0,g_srcc900) 
   IF g_detail_idx > 0 THEN 
      CALL s_asrt801_hint_show('srce_t','srae_t',g_srcc000,g_srcc001,g_srcc002,g_srcc004,g_srcc005,g_srcc006,g_srcc007,g_srce_d[g_detail_idx].srceseq,g_srcc900) 

   END IF
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION asrt801_01_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point  
   #add-point:detail_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="detail_show.before"
   
   #end add-point
   
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION asrt801_01_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE srcc_t.srccsite 
   DEFINE l_oldno     LIKE srcc_t.srccsite 
   DEFINE l_newno02     LIKE srcc_t.srcc000 
   DEFINE l_oldno02     LIKE srcc_t.srcc000 
   DEFINE l_newno03     LIKE srcc_t.srcc001 
   DEFINE l_oldno03     LIKE srcc_t.srcc001 
   DEFINE l_newno04     LIKE srcc_t.srcc002 
   DEFINE l_oldno04     LIKE srcc_t.srcc002 
   DEFINE l_newno05     LIKE srcc_t.srcc004 
   DEFINE l_oldno05     LIKE srcc_t.srcc004 
   DEFINE l_newno06     LIKE srcc_t.srcc005 
   DEFINE l_oldno06     LIKE srcc_t.srcc005 
   DEFINE l_newno07     LIKE srcc_t.srcc006 
   DEFINE l_oldno07     LIKE srcc_t.srcc006 
   DEFINE l_newno08     LIKE srcc_t.srcc007 
   DEFINE l_oldno08     LIKE srcc_t.srcc007 
   DEFINE l_newno09     LIKE srcc_t.srcc900 
   DEFINE l_oldno09     LIKE srcc_t.srcc900 
 
   DEFINE l_master    RECORD LIKE srcc_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE srce_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   
   LET g_master_insert = FALSE
   
   IF g_srcc_m.srccsite IS NULL
   OR g_srcc_m.srcc000 IS NULL
   OR g_srcc_m.srcc001 IS NULL
   OR g_srcc_m.srcc002 IS NULL
   OR g_srcc_m.srcc004 IS NULL
   OR g_srcc_m.srcc005 IS NULL
   OR g_srcc_m.srcc006 IS NULL
   OR g_srcc_m.srcc007 IS NULL
   OR g_srcc_m.srcc900 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_srccsite_t = g_srcc_m.srccsite
   LET g_srcc000_t = g_srcc_m.srcc000
   LET g_srcc001_t = g_srcc_m.srcc001
   LET g_srcc002_t = g_srcc_m.srcc002
   LET g_srcc004_t = g_srcc_m.srcc004
   LET g_srcc005_t = g_srcc_m.srcc005
   LET g_srcc006_t = g_srcc_m.srcc006
   LET g_srcc007_t = g_srcc_m.srcc007
   LET g_srcc900_t = g_srcc_m.srcc900
 
    
   LET g_srcc_m.srccsite = ""
   LET g_srcc_m.srcc000 = ""
   LET g_srcc_m.srcc001 = ""
   LET g_srcc_m.srcc002 = ""
   LET g_srcc_m.srcc004 = ""
   LET g_srcc_m.srcc005 = ""
   LET g_srcc_m.srcc006 = ""
   LET g_srcc_m.srcc007 = ""
   LET g_srcc_m.srcc900 = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
   
   
   #清空key欄位的desc
   
   
   CALL asrt801_01_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_srcc_m.* TO NULL
      INITIALIZE g_srce_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL asrt801_01_show()
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code = 9001 
      LET g_errparam.popup = FALSE 
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt801_01_set_act_visible()   
   CALL asrt801_01_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_srccsite_t = g_srcc_m.srccsite
   LET g_srcc000_t = g_srcc_m.srcc000
   LET g_srcc001_t = g_srcc_m.srcc001
   LET g_srcc002_t = g_srcc_m.srcc002
   LET g_srcc004_t = g_srcc_m.srcc004
   LET g_srcc005_t = g_srcc_m.srcc005
   LET g_srcc006_t = g_srcc_m.srcc006
   LET g_srcc007_t = g_srcc_m.srcc007
   LET g_srcc900_t = g_srcc_m.srcc900
 
   
   #組合新增資料的條件
   LET g_add_browse = " srccent = " ||g_enterprise|| " AND",
                      " srccsite = '", g_srcc_m.srccsite, "' "
                      ," AND srcc000 = '", g_srcc_m.srcc000, "' "
                      ," AND srcc001 = '", g_srcc_m.srcc001, "' "
                      ," AND srcc002 = '", g_srcc_m.srcc002, "' "
                      ," AND srcc004 = '", g_srcc_m.srcc004, "' "
                      ," AND srcc005 = '", g_srcc_m.srcc005, "' "
                      ," AND srcc006 = '", g_srcc_m.srcc006, "' "
                      ," AND srcc007 = '", g_srcc_m.srcc007, "' "
                      ," AND srcc900 = '", g_srcc_m.srcc900, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt801_01_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL asrt801_01_idx_chk()
   
   
   #功能已完成,通報訊息中心
   CALL asrt801_01_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION asrt801_01_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE srce_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE asrt801_01_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM srce_t
    WHERE srceent = g_enterprise AND srcesite = g_srccsite_t
     AND srce000 = g_srcc000_t
     AND srce001 = g_srcc001_t
     AND srce002 = g_srcc002_t
     AND srce004 = g_srcc004_t
     AND srce005 = g_srcc005_t
     AND srce006 = g_srcc006_t
     AND srce007 = g_srcc007_t
     AND srce900 = g_srcc900_t
 
    INTO TEMP asrt801_01_detail
 
   #將key修正為調整後   
   UPDATE asrt801_01_detail 
      #更新key欄位
      SET srcesite = g_srcc_m.srccsite
          , srce000 = g_srcc_m.srcc000
          , srce001 = g_srcc_m.srcc001
          , srce002 = g_srcc_m.srcc002
          , srce004 = g_srcc_m.srcc004
          , srce005 = g_srcc_m.srcc005
          , srce006 = g_srcc_m.srcc006
          , srce007 = g_srcc_m.srcc007
          , srce900 = g_srcc_m.srcc900
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO srce_t SELECT * FROM asrt801_01_detail
   
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "reproduce:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #add-point:單身複製中1 name="detail_reproduce.body.table1.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE asrt801_01_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_srccsite_t = g_srcc_m.srccsite
   LET g_srcc000_t = g_srcc_m.srcc000
   LET g_srcc001_t = g_srcc_m.srcc001
   LET g_srcc002_t = g_srcc_m.srcc002
   LET g_srcc004_t = g_srcc_m.srcc004
   LET g_srcc005_t = g_srcc_m.srcc005
   LET g_srcc006_t = g_srcc_m.srcc006
   LET g_srcc007_t = g_srcc_m.srcc007
   LET g_srcc900_t = g_srcc_m.srcc900
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.delete" >}
#+ 資料刪除
PRIVATE FUNCTION asrt801_01_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_srcc_m.srccsite IS NULL
   OR g_srcc_m.srcc000 IS NULL
   OR g_srcc_m.srcc001 IS NULL
   OR g_srcc_m.srcc002 IS NULL
   OR g_srcc_m.srcc004 IS NULL
   OR g_srcc_m.srcc005 IS NULL
   OR g_srcc_m.srcc006 IS NULL
   OR g_srcc_m.srcc007 IS NULL
   OR g_srcc_m.srcc900 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN asrt801_01_cl USING g_enterprise,g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt801_01_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt801_01_cl
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt801_01_master_referesh USING g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002, 
       g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900 INTO g_srcc_m.srcc007, 
       g_srcc_m.srcc008,g_srcc_m.srcc009,g_srcc_m.srcc001,g_srcc_m.srcc000,g_srcc_m.srcc002,g_srcc_m.srcc004, 
       g_srcc_m.srcc900,g_srcc_m.srccsite,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc008_desc
   
   
   #檢查是否允許此動作
   IF NOT asrt801_01_action_chk() THEN
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_srcc_m_mask_o.* =  g_srcc_m.*
   CALL asrt801_01_srcc_t_mask()
   LET g_srcc_m_mask_n.* =  g_srcc_m.*
   
   CALL asrt801_01_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL asrt801_01_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_srccsite_t = g_srcc_m.srccsite
      LET g_srcc000_t = g_srcc_m.srcc000
      LET g_srcc001_t = g_srcc_m.srcc001
      LET g_srcc002_t = g_srcc_m.srcc002
      LET g_srcc004_t = g_srcc_m.srcc004
      LET g_srcc005_t = g_srcc_m.srcc005
      LET g_srcc006_t = g_srcc_m.srcc006
      LET g_srcc007_t = g_srcc_m.srcc007
      LET g_srcc900_t = g_srcc_m.srcc900
 
 
      DELETE FROM srcc_t
       WHERE srccent = g_enterprise AND srccsite = g_srcc_m.srccsite
         AND srcc000 = g_srcc_m.srcc000
         AND srcc001 = g_srcc_m.srcc001
         AND srcc002 = g_srcc_m.srcc002
         AND srcc004 = g_srcc_m.srcc004
         AND srcc005 = g_srcc_m.srcc005
         AND srcc006 = g_srcc_m.srcc006
         AND srcc007 = g_srcc_m.srcc007
         AND srcc900 = g_srcc_m.srcc900
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_srcc_m.srccsite,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM srce_t
       WHERE srceent = g_enterprise AND srcesite = g_srcc_m.srccsite
         AND srce000 = g_srcc_m.srcc000
         AND srce001 = g_srcc_m.srcc001
         AND srce002 = g_srcc_m.srcc002
         AND srce004 = g_srcc_m.srcc004
         AND srce005 = g_srcc_m.srcc005
         AND srce006 = g_srcc_m.srcc006
         AND srce007 = g_srcc_m.srcc007
         AND srce900 = g_srcc_m.srcc900
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "srce_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_srcc_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE asrt801_01_cl
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_srce_d.clear() 
 
     
      CALL asrt801_01_ui_browser_refresh()  
      #CALL asrt801_01_ui_headershow()  
      #CALL asrt801_01_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL asrt801_01_browser_fill("")
         CALL asrt801_01_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
   ELSE
   END IF
 
   CLOSE asrt801_01_cl
 
   #功能已完成,通報訊息中心
   CALL asrt801_01_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION asrt801_01_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_srce_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF asrt801_01_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT srceseq,srce008,srce009,srce901,srce902,srce905,srce906 ,t1.oocql004 , 
             t2.oocql004 FROM srce_t",   
                     " INNER JOIN srcc_t ON srccent = " ||g_enterprise|| " AND srccsite = srcesite ",
                     " AND srcc000 = srce000 ",
                     " AND srcc001 = srce001 ",
                     " AND srcc002 = srce002 ",
                     " AND srcc004 = srce004 ",
                     " AND srcc005 = srce005 ",
                     " AND srcc006 = srce006 ",
                     " AND srcc007 = srce007 ",
                     " AND srcc900 = srce900 ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN oocql_t t1 ON t1.oocqlent="||g_enterprise||" AND t1.oocql001='225' AND t1.oocql002=srce008 AND t1.oocql003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t2 ON t2.oocqlent="||g_enterprise||" AND t2.oocql001='225' AND t2.oocql002=srce905 AND t2.oocql003='"||g_dlang||"' ",
 
                     " WHERE"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         LET g_sql = g_sql," srceent=? AND srcesite=? AND srce000=? AND srce001=? AND srce002=? AND srce004=? AND srce005=? AND srce006=? AND srce007=? AND srce900=? "
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY srce_t.srceseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt801_01_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR asrt801_01_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002, 
          g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc900 INTO g_srce_d[l_ac].srceseq, 
          g_srce_d[l_ac].srce008,g_srce_d[l_ac].srce009,g_srce_d[l_ac].srce901,g_srce_d[l_ac].srce902, 
          g_srce_d[l_ac].srce905,g_srce_d[l_ac].srce906,g_srce_d[l_ac].srce008_desc,g_srce_d[l_ac].srce905_desc  
            #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         CALL asrt801_01_srce_desc()
         CALL asrt801_01_srce_color()
         #end add-point
      
         IF l_ac > g_max_rec THEN
            IF g_error_show = 1 THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code = 9035 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
            END IF
            EXIT FOREACH
         END IF
         
         LET l_ac = l_ac + 1
      END FOREACH
      LET g_error_show = 0
   
   END IF
    
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   
   #end add-point
   
   CALL g_srce_d.deleteElement(g_srce_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE asrt801_01_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_srce_d.getLength()
      LET g_srce_d_mask_o[l_ac].* =  g_srce_d[l_ac].*
      CALL asrt801_01_srce_t_mask()
      LET g_srce_d_mask_n[l_ac].* =  g_srce_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION asrt801_01_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"
      
      #end add-point    
      DELETE FROM srce_t
       WHERE srceent = g_enterprise AND
         srcesite = ps_keys_bak[1] AND srce000 = ps_keys_bak[2] AND srce001 = ps_keys_bak[3] AND srce002 = ps_keys_bak[4] AND srce004 = ps_keys_bak[5] AND srce005 = ps_keys_bak[6] AND srce006 = ps_keys_bak[7] AND srce007 = ps_keys_bak[8] AND srce900 = ps_keys_bak[9] AND srceseq = ps_keys_bak[10]
      #add-point:delete_b段刪除中 name="delete_b.m_delete"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = ":",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_srce_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION asrt801_01_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
      
      #end add-point 
      INSERT INTO srce_t
                  (srceent,
                   srcesite,srce000,srce001,srce002,srce004,srce005,srce006,srce007,srce900,
                   srceseq
                   ,srce008,srce009,srce901,srce902,srce905,srce906) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5],ps_keys[6],ps_keys[7],ps_keys[8],ps_keys[9],ps_keys[10]
                   ,g_srce_d[g_detail_idx].srce008,g_srce_d[g_detail_idx].srce009,g_srce_d[g_detail_idx].srce901, 
                       g_srce_d[g_detail_idx].srce902,g_srce_d[g_detail_idx].srce905,g_srce_d[g_detail_idx].srce906) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "srce_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_srce_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION asrt801_01_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point   
   DEFINE ps_table         STRING
   DEFINE ps_page          STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10 
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE   
   
   #判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "srce_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL asrt801_01_srce_t_mask_restore('restore_mask_o')
               
      UPDATE srce_t 
         SET (srcesite,srce000,srce001,srce002,srce004,srce005,srce006,srce007,srce900,
              srceseq
              ,srce008,srce009,srce901,srce902,srce905,srce906) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5],ps_keys[6],ps_keys[7],ps_keys[8],ps_keys[9],ps_keys[10]
              ,g_srce_d[g_detail_idx].srce008,g_srce_d[g_detail_idx].srce009,g_srce_d[g_detail_idx].srce901, 
                  g_srce_d[g_detail_idx].srce902,g_srce_d[g_detail_idx].srce905,g_srce_d[g_detail_idx].srce906)  
 
         WHERE srceent = g_enterprise AND srcesite = ps_keys_bak[1] AND srce000 = ps_keys_bak[2] AND srce001 = ps_keys_bak[3] AND srce002 = ps_keys_bak[4] AND srce004 = ps_keys_bak[5] AND srce005 = ps_keys_bak[6] AND srce006 = ps_keys_bak[7] AND srce007 = ps_keys_bak[8] AND srce900 = ps_keys_bak[9] AND srceseq = ps_keys_bak[10]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "srce_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "srce_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt801_01_srce_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION asrt801_01_key_update_b(ps_keys_bak,ps_table)
   #add-point:update_b段define(客製用) name="key_update_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_key       DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_update_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_update_b.pre_function"
   
   #end add-point
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION asrt801_01_key_delete_b(ps_keys_bak,ps_table)
   #add-point:delete_b段define(客製用) name="key_delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_delete_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_delete_b.pre_function"
   
   #end add-point
   
 
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION asrt801_01_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point   
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
    
   #先刷新資料
   #CALL asrt801_01_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "srce_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN asrt801_01_bcl USING g_enterprise,
                                       g_srcc_m.srccsite,g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002, 
                                           g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007, 
                                           g_srcc_m.srcc900,g_srce_d[g_detail_idx].srceseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt801_01_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
 
   
 
   
   #add-point:lock_b段other name="lock_b.other"
   
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION asrt801_01_unlock_b(ps_table,ps_page)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point  
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:unlock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
    
   LET ls_group = "'1',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE asrt801_01_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION asrt801_01_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("srccsite,srcc000,srcc001,srcc002,srcc004,srcc005,srcc006,srcc007,srcc900",TRUE)
      CALL cl_set_comp_entry("",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION asrt801_01_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("srccsite,srcc000,srcc001,srcc002,srcc004,srcc005,srcc006,srcc007,srcc900",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION asrt801_01_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_entry_b.pre_function"
   
   #end add-point
    
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION asrt801_01_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION asrt801_01_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION asrt801_01_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION asrt801_01_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION asrt801_01_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION asrt801_01_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point  
   DEFINE li_idx     LIKE type_t.num10
   DEFINE li_cnt     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE ls_where   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="default_search.before"
   
   #end add-point  
   
   LET g_pagestart = 1
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " srccsite = '", g_argv[01], "' AND "
   END IF
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " srcc000 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET ls_wc = ls_wc, " srcc001 = '", g_argv[03], "' AND "
   END IF
   IF NOT cl_null(g_argv[04]) THEN
      LET ls_wc = ls_wc, " srcc002 = '", g_argv[04], "' AND "
   END IF
   IF NOT cl_null(g_argv[05]) THEN
      LET ls_wc = ls_wc, " srcc004 = '", g_argv[05], "' AND "
   END IF
   IF NOT cl_null(g_argv[06]) THEN
      LET ls_wc = ls_wc, " srcc005 = '", g_argv[06], "' AND "
   END IF
   IF NOT cl_null(g_argv[07]) THEN
      LET ls_wc = ls_wc, " srcc006 = '", g_argv[07], "' AND "
   END IF
   IF NOT cl_null(g_argv[08]) THEN
      LET ls_wc = ls_wc, " srcc007 = '", g_argv[08], "' AND "
   END IF
   IF NOT cl_null(g_argv[09]) THEN
      LET ls_wc = ls_wc, " srcc900 = '", g_argv[09], "' AND "
   END IF
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_default = TRUE
   ELSE
      #若無外部參數則預設為1=2
      LET g_default = FALSE
      
      #預設查詢條件
      CALL cl_qbe_get_default_qryplan() RETURNING ls_where
      IF NOT cl_null(ls_where) THEN
         CALL util.JSON.parse(ls_where, la_wc)
         INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "srcc_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "srce_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
            END IF
 
            IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
            END IF
         
            IF g_wc2.subString(1,5) = " AND " THEN
               LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
            END IF
         END IF
      END IF
    
      IF cl_null(g_wc) AND cl_null(g_wc2) THEN
         LET g_wc = " 1=2"
      END IF
   END IF
   
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point  
 
   IF g_wc.getIndexOf(" 1=2", 1) THEN
      LET g_default = TRUE
   END IF
 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.state_change" >}
   
 
{</section>}
 
{<section id="asrt801_01.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION asrt801_01_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_srce_d.getLength() THEN
         LET g_detail_idx = g_srce_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_srce_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_srce_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION asrt801_01_b_fill2(pi_idx)
   #add-point:b_fill2段define(客製用) name="b_fill2.define_customerization"
   
   #end add-point
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   #add-point:b_fill2段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="b_fill2.pre_function"
   
   #end add-point
   
   LET li_ac = l_ac 
   
   IF g_detail_idx <= 0 THEN
      RETURN
   END IF
   
   LET li_detail_idx_tmp = g_detail_idx
   
 
      
 
      
   #add-point:單身填充後 name="b_fill2.after_fill"
   
   #end add-point
    
   LET l_ac = li_ac
   
   CALL asrt801_01_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION asrt801_01_fill_chk(ps_idx)
   #add-point:fill_chk段define(客製用) name="fill_chk.define_customerization"
   
   #end add-point
   DEFINE ps_idx        LIKE type_t.chr10
   #add-point:fill_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fill_chk.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="fill_chk.before_chk"
   
   #end add-point
   
   #此funtion功能暫時停用(2015/1/12)
   #無論傳入值為何皆回傳true(代表要填充該單身)
 
   #全部為1=1 or null時回傳true
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.status_show" >}
PRIVATE FUNCTION asrt801_01_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.mask_functions" >}
&include "erp/asr/asrt801_01_mask.4gl"
 
{</section>}
 
{<section id="asrt801_01.signature" >}
   
 
{</section>}
 
{<section id="asrt801_01.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION asrt801_01_set_pk_array()
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
   LET g_pk_array[1].values = g_srcc_m.srccsite
   LET g_pk_array[1].column = 'srccsite'
   LET g_pk_array[2].values = g_srcc_m.srcc000
   LET g_pk_array[2].column = 'srcc000'
   LET g_pk_array[3].values = g_srcc_m.srcc001
   LET g_pk_array[3].column = 'srcc001'
   LET g_pk_array[4].values = g_srcc_m.srcc002
   LET g_pk_array[4].column = 'srcc002'
   LET g_pk_array[5].values = g_srcc_m.srcc004
   LET g_pk_array[5].column = 'srcc004'
   LET g_pk_array[6].values = g_srcc_m.srcc005
   LET g_pk_array[6].column = 'srcc005'
   LET g_pk_array[7].values = g_srcc_m.srcc006
   LET g_pk_array[7].column = 'srcc006'
   LET g_pk_array[8].values = g_srcc_m.srcc007
   LET g_pk_array[8].column = 'srcc007'
   LET g_pk_array[9].values = g_srcc_m.srcc900
   LET g_pk_array[9].column = 'srcc900'
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt801_01.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="asrt801_01.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION asrt801_01_msgcentre_notify(lc_state)
   #add-point:msgcentre_notify段define name="msgcentre_notify.define_customerization"
   
   #end add-point   
   DEFINE lc_state LIKE type_t.chr80
   #add-point:msgcentre_notify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="msgcentre_notify.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="msgcentre_notify.pre_function"
   
   #end add-point
   
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = lc_state
 
   #PK資料填寫
   CALL asrt801_01_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_srcc_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt801_01.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION asrt801_01_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt801_01.other_function" readonly="Y" >}

#单头资料显示
PRIVATE FUNCTION asrt801_01_srcc_show()
   LET g_srcc_m.srcc000 = g_srcc000
   LET g_srcc_m.srcc001 = g_srcc001
   LET g_srcc_m.srcc002 = g_srcc002
   LET g_srcc_m.srcc004 = g_srcc004
   LET g_srcc_m.srcc005 = g_srcc005
   LET g_srcc_m.srcc006 = g_srcc006
   LET g_srcc_m.srcc007 = g_srcc007
   LET g_srcc_m.srcc900 = g_srcc900
   LET g_srcc_m.srccsite= g_site
   
   SELECT srcc008,srcc009 INTO g_srcc_m.srcc008,g_srcc_m.srcc009 FROM srcc_t
    WHERE srccent = g_enterprise AND srccsite = g_site
      AND srcc000 = g_srcc000 AND srcc001 = g_srcc001 AND srcc002 = g_srcc002
      AND srcc004 = g_srcc004 AND srcc005 = g_srcc005 AND srcc006 = g_srcc006
      AND srcc007 = g_srcc007 AND srcc900 = g_srcc900
   DISPLAY BY NAME g_srcc_m.srcc000,g_srcc_m.srcc001,g_srcc_m.srcc002,g_srcc_m.srcc004,g_srcc_m.srcc005,g_srcc_m.srcc006,g_srcc_m.srcc007,g_srcc_m.srcc008,g_srcc_m.srcc009,g_srcc_m.srcc900,g_srcc_m.srccsite
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_srcc_m.srcc008
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_srcc_m.srcc008_desc =  g_rtn_fields[1] 
   DISPLAY BY NAME g_srcc_m.srcc008_desc
    
   CALL asrt801_01_srcc_color()
   CALL s_asrt801_hint_show('srcc_t','srac_t',g_srcc000,g_srcc001,g_srcc002,g_srcc004,g_srcc005,g_srcc006,g_srcc007,0,g_srcc900) 

END FUNCTION

#单身资料显示
PRIVATE FUNCTION asrt801_01_srce_desc()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_srce_d[l_ac].srce008
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_srce_d[l_ac].srce008_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_srce_d[l_ac].srce008_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_srce_d[l_ac].srce905
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001= '"||g_acc||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_srce_d[l_ac].srce905_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_srce_d[l_ac].srce905_desc
END FUNCTION

#上站作业+上站作业序检查
PRIVATE FUNCTION asrt801_01_chk_srce008(p_cmd)
DEFINE l_n         LIKE type_t.num5
DEFINE p_cmd       LIKE type_t.chr1

   LET g_errno = ""
   LET l_n = 0
   SELECT COUNT(*) INTO l_n FROM srcc_t
    WHERE srccent = g_enterprise AND srccsite = g_site
      AND srcc000 = g_srcc000 AND srcc001 = g_srcc001 AND srcc002 = g_srcc002
      AND srcc004 = g_srcc004 AND srcc005 = g_srcc005 AND srcc006 = g_srcc006
      AND srcc900 = g_srcc900 AND srcc0011 = g_srce_d[l_ac].srce008
   IF l_n > 0 THEN
      RETURN
   END IF
   LET l_n = 0
   IF p_cmd = 'a' THEN
      SELECT COUNT(*) INTO l_n FROM srcc_t
       WHERE srccent = g_enterprise AND srccsite = g_site
         AND srcc000 = g_srcc000 AND srcc001 = g_srcc001 AND srcc002 = g_srcc002
         AND srcc004 = g_srcc004 AND srcc005 = g_srcc005 AND srcc006 = g_srcc006
         AND srcc900 = g_srcc900
         AND srcc008 = g_srce_d[l_ac].srce008
         AND srcc009 = g_srce_d[l_ac].srce009
   ELSE
      SELECT COUNT(*) INTO l_n FROM srcc_t
       WHERE srccent = g_enterprise AND srccsite = g_site
         AND srcc000 = g_srcc000 AND srcc001 = g_srcc001 AND srcc002 = g_srcc002
         AND srcc004 = g_srcc004 AND srcc005 = g_srcc005 AND srcc006 = g_srcc006
         AND srcc900 = g_srcc900
         AND srcc008 = g_srce_d[l_ac].srce008
         AND srcc009 = g_srce_d[l_ac].srce009
         AND srcc007 <> g_srcc_m.srcc007
   END IF
   IF l_n = 0 THEN
      LET g_errno = 'aec-00007'
   END IF

END FUNCTION

#单头颜色显示
PRIVATE FUNCTION asrt801_01_srcc_color()
DEFINE l_srcf008         LIKE srcf_t.srcf008

   CALL cl_set_comp_font_color("srcc007,srcc008,srcc009","black")
   DECLARE sel_srcc_srcf_cs1 CURSOR FOR 
    SELECT srcf008 FROM srcf_t
     WHERE srcfent = g_enterprise AND srcfsite = g_site
       AND srcf000 = g_srcc000
       AND srcf001 = g_srcc001
       AND srcf002 = g_srcc002
       AND srcf003 = g_srcc004
       AND srcf004 = g_srcc005
       AND srcf005 = g_srcc006
       AND srcf006 = g_srcc007
       AND srcfseq = 0
       AND srcf007 = g_srcc900 
       AND (srcf008 = 'srac007' OR srcf008 = 'srac008' OR srcf008 = 'srac009') 
   FOREACH sel_srcc_srcf_cs1 INTO l_srcf008
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      LET l_srcf008 = cl_replace_str(l_srcf008,'srac','srcc')
      CALL cl_set_comp_font_color(l_srcf008,"red")
   END FOREACH  
END FUNCTION

#单身颜色显示
PRIVATE FUNCTION asrt801_01_srce_color()
DEFINE l_srcf008         LIKE srcf_t.srcf008

   LET g_srce_d_color[l_ac].srce008       = 'black'
   LET g_srce_d_color[l_ac].srce008_desc  = 'black'
   LET g_srce_d_color[l_ac].srce009       = 'black'
   
   DECLARE sel_srce_srcf_cs1 CURSOR FOR 
    SELECT srcf008 FROM srcf_t
     WHERE srcfent = g_enterprise AND srcfsite = g_site
       AND srcf000 = g_srcc000
       AND srcf001 = g_srcc001
       AND srcf002 = g_srcc002
       AND srcf003 = g_srcc004
       AND srcf004 = g_srcc005
       AND srcf005 = g_srcc006
       AND srcf006 = g_srcc007
       AND srcfseq = g_srce_d[l_ac].srceseq
       AND srcf007 = g_srcc900 
       AND srcf008 LIKE 'srae%'
   FOREACH sel_srce_srcf_cs1 INTO l_srcf008
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      LET l_srcf008 = cl_replace_str(l_srcf008,'srae','srce')
      CASE l_srcf008
         WHEN 'srceseq' 
            LET g_srce_d_color[l_ac].srceseq       = 'red'
         WHEN 'srce008' 
            LET g_srce_d_color[l_ac].srce008       = 'red'
            LET g_srce_d_color[l_ac].srce008_desc  = 'red'
         WHEN 'srce009' 
            LET g_srce_d_color[l_ac].srce009       = 'red'
      END CASE
   END FOREACH  
END FUNCTION

 
{</section>}
 
