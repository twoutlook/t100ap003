#該程式未解開Section, 採用最新樣板產出!
{<section id="asrt340_01.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0009(2016-06-17 15:11:09), PR版次:0009(2016-12-29 17:40:57)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000131
#+ Filename...: asrt340_01
#+ Description: 重複性工單完工入庫單-入庫明細維護作業
#+ Creator....: 00378(2014-03-13 17:19:19)
#+ Modifier...: 07024 -SD/PR- 02159
 
{</section>}
 
{<section id="asrt340_01.global" >}
#應用 p00 樣板自動產生(Version:5)
#add-point:填寫註解說明 name="main.memo"
#160316-00007#7   2016/03/18  By xianghui 库存管理特征处增加制造批序号处理
#160318-00025#22  2016/04/21  BY 07900    校验代码重复错误讯息的修改
#160905-00007#15  2016/09/05  by 08172    调整系统中无ENT的SQL条件增加ent
#161006-00018#15  2016/11/14  By 02295    增加D-MFG-0085参数，当其为Y时，如果申请资料有指定库储批，则实际出入库的库储批不可修改
#161124-00048#21  2016/12/13  By xujing   整批调整系统RECORD LIKE xxxx_t.* 星号写法
#160824-00007#285 2016/12/29  by sakura   新舊值備份處理
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
 
IMPORT os
#add-point:增加匯入項目 name="main.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="asrt340_01.free_style_variable" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
{<Module define>}

#單身 type 宣告
 TYPE type_g_sfeb_d RECORD
        sfebdocno LIKE sfeb_t.sfebdocno, 
        sfebseq LIKE sfeb_t.sfebseq, 
        sfeb023 LIKE sfeb_t.sfeb023, 
        sfeb023_desc1 LIKE type_t.chr500, 
        sfeb023_desc2 LIKE type_t.chr500,   
        sfeb024 LIKE sfeb_t.sfeb024,
        sfeb025 LIKE sfeb_t.sfeb025,                      
        sfeb002 LIKE sfeb_t.sfeb002, 
        sfeb003 LIKE sfeb_t.sfeb003, 
        sfeb004 LIKE sfeb_t.sfeb004, 
        sfeb004_desc1 LIKE type_t.chr500, 
        sfeb004_desc2 LIKE type_t.chr500, 
        sfeb005 LIKE sfeb_t.sfeb005, 
        sfeb006 LIKE sfeb_t.sfeb006, 
        sfeb007 LIKE sfeb_t.sfeb007, 
        sfeb008 LIKE sfeb_t.sfeb008, 
        sfeb027 LIKE sfeb_t.sfeb027,
        sfeb009 LIKE sfeb_t.sfeb009, 
        sfeb010 LIKE sfeb_t.sfeb010, 
        sfeb011 LIKE sfeb_t.sfeb011, 
        sfeb012 LIKE sfeb_t.sfeb012, 
        sfeb013 LIKE sfeb_t.sfeb013, 
        sfeb013_desc LIKE type_t.chr500, 
        sfeb014 LIKE sfeb_t.sfeb014, 
        sfeb014_desc LIKE type_t.chr500, 
        sfeb015 LIKE sfeb_t.sfeb015, 
        sfeb016 LIKE sfeb_t.sfeb016, 
        sfeb017 LIKE sfeb_t.sfeb017, 
        sfeb018 LIKE sfeb_t.sfeb018, 
        sfeb019 LIKE sfeb_t.sfeb019, 
        sfeb020 LIKE sfeb_t.sfeb020, 
        sfeb021 LIKE sfeb_t.sfeb021, 
        sfeb022 LIKE sfeb_t.sfeb022, 
        sfebsite LIKE sfeb_t.sfebsite
       END RECORD
 TYPE type_g_sfec_d RECORD
       sfecseq1 LIKE sfec_t.sfecseq1, 
   sfec001 LIKE sfec_t.sfec001, 
   sfec002 LIKE sfec_t.sfec002, 
   sfec003 LIKE sfec_t.sfec003, 
   sfec003_desc1 LIKE type_t.chr500, 
   sfec003_desc2 LIKE type_t.chr500, 
   sfec004 LIKE sfec_t.sfec004, 
   sfec005 LIKE sfec_t.sfec005, 
   sfec005_desc1 LIKE type_t.chr500, 
   sfec005_desc2 LIKE type_t.chr500, 
   sfec006 LIKE sfec_t.sfec006, 
   sfec007 LIKE sfec_t.sfec007, 
   sfec008 LIKE sfec_t.sfec008, 
   sfec009 LIKE sfec_t.sfec009, 
   sfec010 LIKE sfec_t.sfec010, 
   sfec011 LIKE sfec_t.sfec011, 
   sfec012 LIKE sfec_t.sfec012, 
   sfec012_desc LIKE type_t.chr500, 
   sfec013 LIKE sfec_t.sfec013, 
   sfec013_desc LIKE type_t.chr500, 
   sfec014 LIKE sfec_t.sfec014, 
   sfec015 LIKE sfec_t.sfec015, 
   sfec016 LIKE sfec_t.sfec016, 
   sfec018 LIKE sfec_t.sfec018,
   sfec019 LIKE sfec_t.sfec019,
   sfec020 LIKE sfec_t.sfec020,
   sfec017 LIKE sfec_t.sfec017, 
   sfecsite LIKE sfec_t.sfecsite
       END RECORD



#無單身append欄位定義

#模組變數(Module Variables)
DEFINE g_master                     type_g_sfeb_d
DEFINE g_master_t                   type_g_sfeb_d
DEFINE g_sfeb_d          DYNAMIC ARRAY OF type_g_sfeb_d
DEFINE g_sfeb_d_t        type_g_sfeb_d
DEFINE g_sfec_d   DYNAMIC ARRAY OF type_g_sfec_d
DEFINE g_sfec_d_t type_g_sfec_d
DEFINE g_sfec_d_o type_g_sfec_d


DEFINE g_wc                 STRING
DEFINE g_wc2                STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10
DEFINE l_ac                 LIKE type_t.num5
DEFINE l_ac_d               LIKE type_t.num5              #單身idx
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_master_idx         LIKE type_t.num5              #單身 所在筆數(暫存用)
DEFINE g_detail_idx         LIKE type_t.num5              #單身 所在筆數(所有資料)
DEFINE g_detail_idx2        LIKE type_t.num5              #單身 所在筆數(所有資料)
DEFINE g_detail_cnt         LIKE type_t.num5              #單身 總筆數(所有資料)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5

#多table用wc
DEFINE g_wc_table           STRING

DEFINE g_wc2_table2   STRING



{</Module define>}
#end add-point
 
{</section>}
 
{<section id="asrt340_01.global_variable" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_sfebdocno       LIKE sfeb_t.sfebdocno
DEFINE g_flag            LIKE type_t.chr1  
#end add-point
 
{</section>}
 
{<section id="asrt340_01.other_dialog" >}

 
{</section>}
 
{<section id="asrt340_01.other_function" readonly="Y" >}

PUBLIC FUNCTION asrt340_01(--)
   p_sfebdocno	          
   )

   DEFINE p_sfebdocno     LIKE sfeb_t.sfebdocno


   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log


   #畫面開啟 (identifier)
   OPEN WINDOW w_asrt340_01 WITH FORM cl_ap_formpath("asr","asrt340_01")

   #瀏覽頁簽資料初始化
   CALL cl_ui_init()

   LET g_sfebdocno = p_sfebdocno
   #程式初始化
   CALL asrt340_01_init()

   #進入選單 Menu (="N")
   CALL asrt340_01_ui_dialog()

   #畫面關閉
   CLOSE WINDOW w_asrt340_01



END FUNCTION

PRIVATE FUNCTION asrt340_01_init()
   #add-point:init段define
   {<point name="init.define"/>}
   #end add-point

   LET g_error_show = 1



   #add-point:畫面資料初始化
   {<point name="init.init" />}
   CALL cl_set_combo_scc_part('sfeb003','4019','1,2,5')
   CALL cl_set_combo_scc_part('sfec004','4019','1,2,5')            
   #end add-point

   CALL asrt340_01_default_search()

END FUNCTION

PRIVATE FUNCTION asrt340_01_ui_dialog()
   {<Local define>}
   DEFINE li_idx   LIKE type_t.num5
   {</Local define>}
   #add-point:ui_dialog段define
   {<point name="ui_dialog.define"/>}
   #end add-point

   LET g_action_choice = " "
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()

   CALL cl_set_act_visible("accept,cancel", FALSE)

   #add-point:ui_dialog段before dialog
   {<point name="ui_dialog.before_dialog"/>}
   #end add-point

   WHILE TRUE

      CALL asrt340_01_b_fill(g_wc)

      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_sfeb_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)

            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)

            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               LET g_master_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont()
               LET g_master.* = g_sfeb_d[g_master_idx].*
               CALL asrt340_01_fetch()

            #自訂ACTION(detail_show,page_1)


         END DISPLAY

         DISPLAY ARRAY g_sfec_d TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)

            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx2)

            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont()

               #LET g_master_idx = l_ac
               #CALL asrt340_01_fetch()

            #自訂ACTION(detail_show,page_2)


         END DISPLAY



         #add-point:ui_dialog段define
         {<point name="ui_dialog.more_displayarray"/>}
         #end add-point

         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            IF g_master_idx > 0 THEN
               IF g_master_idx > g_sfeb_d.getLength() THEN
                  LET g_master_idx = g_sfeb_d.getLength()
               END IF
               CALL DIALOG.setCurrentRow("s_detail1", g_master_idx)
               LET l_ac = g_master_idx
            END IF
            LET g_master_idx = l_ac
            NEXT FIELD CURRENT

         ON ACTION modify_detail

            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               CALL asrt340_01_modify()
               #add-point:ON ACTION modify_detail
               {<point name="menu.modify_detail" />}
               #END add-point
               EXIT DIALOG
            END IF

         ON ACTION close
            LET INT_FLAG=FALSE
            LET g_action_choice="exit"
            EXIT DIALOG

         ON ACTION exit
            LET g_action_choice="exit"
            EXIT DIALOG



         #主選單用ACTION
         &include "main_menu.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG

      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         EXIT WHILE
      END IF

   END WHILE

   CALL cl_set_act_visible("accept,cancel", TRUE)

END FUNCTION

PRIVATE FUNCTION asrt340_01_modify()
   #add-point:modify段define
   DEFINE l_sfeastus    LIKE sfea_t.sfeastus
   #end add-point

   #add-point:modify段新增前
   SELECT sfeastus INTO l_sfeastus FROM sfea_t
    WHERE sfeaent   = g_enterprise
      AND sfeadocno = g_sfebdocno
   IF l_sfeastus = 'S' THEN
      #已过帐资料,不可修改
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00119'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN 
   END IF
   #end add-point

   #進入資料輸入段落
   CALL asrt340_01_input('u')

   #add-point:modify段新增後
   {<point name="modify.after_modify"/>}
   #end add-point

END FUNCTION

PRIVATE FUNCTION asrt340_01_input(p_cmd)
   {<Local define>}
   DEFINE  p_cmd           LIKE type_t.chr1
   DEFINE  l_cmd           LIKE type_t.chr1
   DEFINE  l_ac_t          LIKE type_t.num5                #未取消的ARRAY CNT
   DEFINE  l_n             LIKE type_t.num5                #檢查重複用
   DEFINE  l_cnt           LIKE type_t.num5                #檢查重複用
   DEFINE  l_lock_sw       LIKE type_t.chr1                #單身鎖住否
   DEFINE  l_allow_insert  LIKE type_t.num5                #可新增否
   DEFINE  l_allow_delete  LIKE type_t.num5                #可刪除否
   DEFINE  l_count         LIKE type_t.num5
   DEFINE  l_i             LIKE type_t.num5
   DEFINE  ls_return       STRING
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   DEFINE  l_ooef025       LIKE ooef_t.ooef025
   DEFINE  l_qcao005       LIKE qcao_t.qcao005
   DEFINE  l_qcao006       LIKE qcao_t.qcao006
   DEFINE  l_qcao007       LIKE qcao_t.qcao007
#   DEFINE  l_qcbc          RECORD LIKE qcbc_t.*    #161124-00048#21 mark
   #161124-00048#21 add(s)
   DEFINE l_qcbc RECORD  #品質檢驗判定結果檔
       qcbcent LIKE qcbc_t.qcbcent, #企业编号
       qcbcsite LIKE qcbc_t.qcbcsite, #营运据点
       qcbcdocno LIKE qcbc_t.qcbcdocno, #单号
       qcbcseq LIKE qcbc_t.qcbcseq, #行序
       qcbc001 LIKE qcbc_t.qcbc001, #类型
       qcbc002 LIKE qcbc_t.qcbc002, #判定结果编号
       qcbc003 LIKE qcbc_t.qcbc003, #料件编号
       qcbc004 LIKE qcbc_t.qcbc004, #产品特征
       qcbc005 LIKE qcbc_t.qcbc005, #库位
       qcbc006 LIKE qcbc_t.qcbc006, #储位
       qcbc007 LIKE qcbc_t.qcbc007, #批号
       qcbc008 LIKE qcbc_t.qcbc008, #单位
       qcbc009 LIKE qcbc_t.qcbc009, #判定数量
       qcbc010 LIKE qcbc_t.qcbc010, #已入库数
       qcbc011 LIKE qcbc_t.qcbc011, #库存备注
       qcbc012 LIKE qcbc_t.qcbc012, #判定区分
       qcbc013 LIKE qcbc_t.qcbc013  #处理方式
END RECORD
   #161124-00048#21 add(e)
   {</Local define>}
   #add-point:input段define
   DEFINE  l_success       LIKE type_t.num5
   #end add-point

   LET g_action_choice = ""

   LET g_qryparam.state = "i"

   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")

   #add-point:input段define_sql
   {<point name="input.define_sql" mark="Y"/>}
   #end add-point
   LET g_forupd_sql = "SELECT sfebdocno,sfebseq,sfeb023,'','',sfeb024,sfeb025,sfeb002,sfeb003,sfeb004,
       '','',sfeb005,sfeb006,sfeb007,sfeb008,sfeb027,sfeb009,sfeb010,sfeb011,sfeb012,sfeb013,'',sfeb014,'',sfeb015,
       sfeb016,sfeb017,sfeb018,sfeb019,sfeb020,sfeb021,sfeb022,sfebsite FROM sfeb_t WHERE sfebent=? AND sfebdocno=? AND sfebseq=?
       FOR UPDATE"
   #add-point:input段define_sql
   {<point name="input.after_define_sql"/>}
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE asrt340_01_bcl CURSOR FROM g_forupd_sql      # LOCK CURSOR



   #add-point:input段define_sql
   {<point name="input.define_sql2" mark="Y"/>}
   #end add-point
   LET g_forupd_sql = "SELECT sfecseq1,sfec001,sfec002,sfec003,'','',sfec004,sfec005,'','',sfec006,sfec007,sfec008,
       sfec009,sfec010,sfec011,sfec012,'',sfec013,'',sfec014,sfec015,sfec016,sfec018,sfec019,sfec020,sfec017,sfecsite FROM sfec_t
       WHERE sfecent=? AND sfecdocno=? AND sfecseq=? AND sfecseq1=? FOR UPDATE"
   #add-point:input段define_sql
   {<point name="input.after_define_sql2"/>}
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE asrt340_01_bcl2 CURSOR FROM g_forupd_sql

 
   #add-point:input段修改前
   {<point name="input.before_input"/>}
   #end add-point

   LET INT_FLAG = 0

   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

         DISPLAY ARRAY g_sfeb_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)

            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)

            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               LET g_master_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont()
               LET g_master.* = g_sfeb_d[g_master_idx].*
               CALL asrt340_01_fetch()

            #自訂ACTION(detail_show,page_1)


         END DISPLAY


      #實際單身段落
      INPUT ARRAY g_sfec_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效!

                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)

         #自訂ACTION(detail_input,page_2)


         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN
              CALL FGL_SET_ARR_CURR(g_sfec_d.getLength()+1)
              LET g_insert = 'N'
           END IF
            LET g_master.* = g_sfeb_d[g_master_idx].*
            LET g_detail_cnt = g_sfec_d.getLength()
            CALL asrt340_01_set_entry_b('a')
            CALL asrt340_01_set_no_entry_b('a')
            CALL cl_set_comp_required("sfec002,sfec003",FALSE)
            IF g_master.sfeb002 = 'Y' THEN   #FQC否
               CALL cl_set_comp_required("sfec002,sfec003",TRUE)
            END IF            

         BEFORE INSERT

            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sfec_d[l_ac].* TO NULL
            #料件/特性/特征
            LET g_sfec_d[l_ac].sfec018 = g_master.sfeb023
            LET g_sfec_d[l_ac].sfec019 = g_master.sfeb024
            LET g_sfec_d[l_ac].sfec020 = g_master.sfeb025            
            #营运据点
            LET g_sfec_d[l_ac].sfecsite = g_master.sfebsite
            #包装容器
            LET g_sfec_d[l_ac].sfec007 = g_master.sfeb006
            #单位
            LET g_sfec_d[l_ac].sfec008 = g_master.sfeb007
            #参考单位
            LET g_sfec_d[l_ac].sfec010 = g_master.sfeb010
            #数量
            LET g_sfec_d[l_ac].sfec009 = 0
            #参考数量
            LET g_sfec_d[l_ac].sfec011 = 0
          
            IF g_master.sfeb002 = 'N' THEN
               #入库类型
               LET g_sfec_d[l_ac].sfec004 = g_master.sfeb003
               #料件
               LET g_sfec_d[l_ac].sfec005 = g_master.sfeb004
               CALL s_desc_get_item_desc(g_sfec_d[l_ac].sfec005)
                    RETURNING g_sfec_d[l_ac].sfec005_desc1,g_sfec_d[l_ac].sfec005_desc2          
               #特征
               LET g_sfec_d[l_ac].sfec006 = g_master.sfeb005

               LET g_sfec_d[l_ac].sfec012 = g_master.sfeb013
               LET g_sfec_d[l_ac].sfec012_desc = s_desc_get_stock_desc(g_site,g_sfec_d[l_ac].sfec012)
               #储位
               LET g_sfec_d[l_ac].sfec013 = g_master.sfeb014
               LET g_sfec_d[l_ac].sfec013_desc = s_desc_get_locator_desc(g_site,g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013)             
            END IF
            #批号  
            LET g_sfec_d[l_ac].sfec014 = g_master.sfeb015
            #库存管理特征
            LET g_sfec_d[l_ac].sfec015 = g_master.sfeb016
            #有效日期
            LET g_sfec_d[l_ac].sfec016 = g_master.sfeb021
            #库存备注
            LET g_sfec_d[l_ac].sfec016 = g_master.sfeb022   

            LET g_sfec_d_t.* = g_sfec_d[l_ac].*     #新輸入資料
            LET g_sfec_d_o.* = g_sfec_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt340_01_set_entry_b("a")
            CALL asrt340_01_set_no_entry_b("a")
            #公用欄位給值(單身2)

            #add-point:input段before insert
            {<point name="input.body2.before_insert"/>}
            #end add-point

         BEFORE ROW
            LET p_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx2 = l_ac
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_n TO FORMONLY.idx

            CALL s_transaction_begin()

            LET g_detail_cnt = g_sfec_d.getLength()

            IF g_detail_cnt >= l_ac
               AND g_sfec_d[l_ac].sfecseq1 IS NOT NULL
            THEN
               LET l_cmd='u'
               LET g_sfec_d_t.* = g_sfec_d[l_ac].*  #BACKUP
               LET g_sfec_d_o.* = g_sfec_d[l_ac].*  #BACKUP
               IF NOT asrt340_01_lock_b("sfec_t") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt340_01_bcl2 INTO g_sfec_d[l_ac].sfecseq1,g_sfec_d[l_ac].sfec001,g_sfec_d[l_ac].sfec002, 
                      g_sfec_d[l_ac].sfec003,g_sfec_d[l_ac].sfec003_desc1,g_sfec_d[l_ac].sfec003_desc2, 
                      g_sfec_d[l_ac].sfec004,g_sfec_d[l_ac].sfec005,g_sfec_d[l_ac].sfec005_desc1, 
                      g_sfec_d[l_ac].sfec005_desc2,g_sfec_d[l_ac].sfec006,g_sfec_d[l_ac].sfec007, 
                      g_sfec_d[l_ac].sfec008,g_sfec_d[l_ac].sfec009,g_sfec_d[l_ac].sfec010,g_sfec_d[l_ac].sfec011, 
                      g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec012_desc,g_sfec_d[l_ac].sfec013,g_sfec_d[l_ac].sfec013_desc, 
                      g_sfec_d[l_ac].sfec014,g_sfec_d[l_ac].sfec015,g_sfec_d[l_ac].sfec016,g_sfec_d[l_ac].sfec018, 
                      g_sfec_d[l_ac].sfec019,g_sfec_d[l_ac].sfec020,g_sfec_d[l_ac].sfec017, 
                      g_sfec_d[l_ac].sfecsite
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  CALL cl_show_fld_cont()
                  LET g_flag = '2'
                  CALL asrt340_01_detail_show()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            CALL asrt340_01_set_entry_b(l_cmd)
            CALL asrt340_01_set_no_entry_b(l_cmd)
            #add-point:input段before row
            {<point name="input.body2.before_row"/>}
            #end add-point
            #其他table資料備份(確定是否更改用)

            #其他table進行lock


         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
               CALL g_sfec_d.deleteElement(l_ac)
               NEXT FIELD sfecseq1
            END IF
            IF g_sfec_d[l_ac].sfecseq1 IS NOT NULL
            THEN
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code =  -263
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CANCEL DELETE
               END IF

               #add-point:單身2刪除前
               {<point name="input.body2.b_delete" mark="Y"/>}
               #end add-point

               DELETE FROM sfec_t
                WHERE sfecent = g_enterprise AND
                   sfecdocno = g_master.sfebdocno
                   AND sfecseq = g_master.sfebseq

                   AND sfecseq1 = g_sfec_d_t.sfecseq1

               #add-point:單身2刪除中
               {<point name="input.body2.m_delete"/>}
               #end add-point

               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "sfeb_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  CANCEL DELETE
               ELSE
                  LET g_detail_cnt = g_detail_cnt-1

                  #add-point:單身2刪除後
                  #实际入库数量更新申请单数量
                  CALL s_asft340_upd_sfeb_qty(g_master.sfebdocno,g_master.sfebseq)
                       RETURNING l_success
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     CANCEL DELETE
                  END IF
                  #end add-point
                  CALL s_transaction_end('Y','0')
               END IF
               CLOSE asrt340_01_bcl
               LET l_count = g_sfeb_d.getLength()
            END IF
                           INITIALIZE gs_keys TO NULL
               LET gs_keys[1] = g_sfeb_d[g_detail_idx].sfebdocno
               LET gs_keys[2] = g_sfeb_d[g_detail_idx].sfebseq
               LET gs_keys[3] = g_sfec_d[g_detail_idx2].sfecseq1


         AFTER DELETE
            #add-point:單身AFTER DELETE
            {<point name="input.body2.after_delete"/>}
            #end add-point
                           CALL asrt340_01_delete_b('sfec_t',gs_keys,"'2'")

         AFTER INSERT
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
            
            CALL asrt340_01_chk_sfec009()
                 RETURNING l_success
            IF NOT l_success THEN
               CANCEL INSERT
            END IF

            LET l_count = 1
            SELECT COUNT(*) INTO l_count FROM sfec_t
             WHERE sfecent = g_enterprise AND
                   sfecdocno = g_master.sfebdocno
                   AND sfecseq = g_master.sfebseq

                   AND sfecseq1 = g_sfec_d[g_detail_idx2].sfecseq1

            #資料未重複, 插入新增資料
            IF l_count = 0 THEN
               #add-point:單身2新增前
               {<point name="input.body2.b_insert"/>}
               #end add-point

                              INITIALIZE gs_keys TO NULL
               LET gs_keys[1] = g_sfeb_d[g_detail_idx].sfebdocno
               LET gs_keys[2] = g_sfeb_d[g_detail_idx].sfebseq
               LET gs_keys[3] = g_sfec_d[g_detail_idx2].sfecseq1
               CALL asrt340_01_insert_b('sfec_t',gs_keys,"'2'")

               #add-point:單身新增後2
               #实际入库数量更新申请单数量
               CALL s_asft340_upd_sfeb_qty(g_master.sfebdocno,g_master.sfebseq)
                    RETURNING l_success
               IF NOT l_success THEN
                  INITIALIZE g_sfeb_d[l_ac].* TO NULL
                  CALL s_transaction_end('N','0')
                  CANCEL INSERT
               END IF
               #end add-point
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               INITIALIZE g_sfeb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF

            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "sfec_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CALL s_transaction_end('N','0')
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt340_01_b_fill(g_wc)
               #資料多語言用-增/改

               #add-point:單身新增後
               {<point name="input.body2.after_insert"/>}
               #end add-point
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_detail_cnt = g_detail_cnt + 1
            END IF

         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_sfec_d[l_ac].* = g_sfec_d_t.*
               CLOSE asrt340_01_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG
            END IF

            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_sfec_d[l_ac].* = g_sfec_d_t.*
            ELSE
               #寫入修改者/修改日期資訊(單身2)


               #add-point:單身page2修改前
               {<point name="input.body2.b_update" mark="Y"/>}
               #end add-point

               UPDATE sfec_t SET (sfecseq1,sfec001,sfec002,sfec003,sfec004,sfec005,sfec006,sfec007,sfec008,
                   sfec009,sfec010,sfec011,sfec012,sfec013,sfec014,sfec015,sfec016,sfec018,sfec019,sfec020,sfec017,sfecsite) = (g_sfec_d[l_ac].sfecseq1,
                   g_sfec_d[l_ac].sfec001,g_sfec_d[l_ac].sfec002,g_sfec_d[l_ac].sfec003,g_sfec_d[l_ac].sfec004,
                   g_sfec_d[l_ac].sfec005,g_sfec_d[l_ac].sfec006,g_sfec_d[l_ac].sfec007,g_sfec_d[l_ac].sfec008,
                   g_sfec_d[l_ac].sfec009,g_sfec_d[l_ac].sfec010,g_sfec_d[l_ac].sfec011,g_sfec_d[l_ac].sfec012,
                   g_sfec_d[l_ac].sfec013,g_sfec_d[l_ac].sfec014,g_sfec_d[l_ac].sfec015,g_sfec_d[l_ac].sfec016,
                   g_sfec_d[l_ac].sfec018,g_sfec_d[l_ac].sfec019,g_sfec_d[l_ac].sfec020,g_sfec_d[l_ac].sfec017,g_sfec_d[l_ac].sfecsite) #自訂欄位頁簽
                WHERE sfecent = g_enterprise AND
                   sfecdocno = g_master.sfebdocno
                   AND sfecseq = g_master.sfebseq

                   AND sfecseq1 = g_sfec_d_t.sfecseq1

               #add-point:單身修改中
               {<point name="input.body2.m_update"/>}
               #end add-point

               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "sfec_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CALL s_transaction_end('N','0')
                     LET g_sfec_d[l_ac].* = g_sfec_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "sfec_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()

                     CALL s_transaction_end('N','0')
                     LET g_sfec_d[l_ac].* = g_sfec_d_t.*
                  OTHERWISE
                     INITIALIZE gs_keys TO NULL
                     LET gs_keys[1] = g_sfeb_d[g_detail_idx].sfebdocno
                     LET gs_keys_bak[1] = g_sfeb_d[g_detail_idx].sfebdocno
                     LET gs_keys[2] = g_sfeb_d[g_detail_idx].sfebseq
                     LET gs_keys_bak[2] = g_sfeb_d[g_detail_idx].sfebseq
                     LET gs_keys[3] = g_sfec_d[g_detail_idx2].sfecseq1
                     LET gs_keys_bak[3] = g_sfec_d_t.sfecseq1
                     CALL asrt340_01_update_b('sfec_t',gs_keys,gs_keys_bak,"'2'")

                     #資料多語言用-增/改
                     #实际入库数量更新申请单数量
                     IF g_sfec_d[l_ac].sfec009 <> g_sfec_d_t.sfec009 OR 
                        g_sfec_d[l_ac].sfec011 <> g_sfec_d_t.sfec011 THEN
                        CALL s_asft340_upd_sfeb_qty(g_master.sfebdocno,g_master.sfebseq)
                             RETURNING l_success
                        IF NOT l_success THEN
                           CALL s_transaction_end('N','0')
                           LET g_sfec_d[l_ac].* = g_sfec_d_t.*
                        END IF
                     END IF

               END CASE
               #add-point:單身page2修改後
               {<point name="input.body2.a_update"/>}
               #end add-point
            END IF

         #---------------------<  Detail: page2  >---------------------
         #----<<sfecseq1>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfecseq1
            #add-point:BEFORE FIELD sfecseq1
            IF l_cmd = 'a' THEN
               SELECT MAX(sfecseq1) + 1 INTO g_sfec_d[l_ac].sfecseq1 FROM sfec_t
                WHERE sfecent   = g_enterprise
                  AND sfecdocno = g_sfebdocno   #全局变量
                  AND sfecseq   = g_master.sfebseq
               IF cl_null(g_sfec_d[l_ac].sfecseq1) THEN
                  LET g_sfec_d[l_ac].sfecseq1 = 1
               END IF
               DISPLAY BY NAME g_sfec_d[l_ac].sfecseq1 
            END IF 
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfecseq1

            #add-point:AFTER FIELD sfecseq1
            #此段落由子樣板a05產生
            IF g_sfec_d[l_ac].sfecseq1 IS NOT NULL THEN
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_sfec_d[l_ac].sfecseq1 != g_sfec_d_t.sfecseq1) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfec_t WHERE sfecent = " ||g_enterprise|| " AND sfecdocno = '"||g_sfebdocno ||"' AND sfecseq = "||g_master.sfebseq ||" AND sfecseq1 = " || g_sfec_d[l_ac].sfecseq1 ,'std-00004',0) THEN
                     LET g_sfec_d[l_ac].sfecseq1 = g_sfec_d_t.sfecseq1
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            IF g_master.sfeb002 = 'N' AND (cl_null(g_sfec_d[l_ac].sfec009) OR g_sfec_d[l_ac].sfec009 = 0 ) THEN
               LET g_sfec_d[l_ac].sfec009 = asrt340_01_get_sfec009()
               DISPLAY BY NAME g_sfec_d[l_ac].sfec009
            END IF 
            IF g_master.sfeb002 = 'N' AND (cl_null(g_sfec_d[l_ac].sfec011) OR g_sfec_d[l_ac].sfec011 = 0 ) THEN
               LET g_sfec_d[l_ac].sfec011 = asrt340_01_get_sfec011()
               DISPLAY BY NAME g_sfec_d[l_ac].sfec011               
            END IF                 


          {#ADP版次:1#}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfecseq1
            #add-point:ON CHANGE sfecseq1
            {<point name="input.g.page2.sfecseq1" />}
            #END add-point

         #----<<sfec001>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec001
            #add-point:BEFORE FIELD sfec001
            {<point name="input.b.page2.sfec001" />}
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec001

            #add-point:AFTER FIELD sfec001
            {<point name="input.a.page2.sfec001" />}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec001
            #add-point:ON CHANGE sfec001
            {<point name="input.g.page2.sfec001" />}
            #END add-point

         #----<<sfec002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec002
            #add-point:BEFORE FIELD sfec002
            CALL cl_set_comp_required("sfec002,sfec003",FALSE)
            IF g_master.sfeb002 = 'Y' THEN   #FQC否
               CALL cl_set_comp_required("sfec002,sfec003",TRUE)
            END IF           
            IF cl_null(g_sfec_d[l_ac].sfec002) THEN
               CALL asrt340_01_set_sfec002()
            END IF
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec002

            #add-point:AFTER FIELD sfec002
            IF g_master.sfeb002 = 'Y' THEN   #FQC
               IF cl_null(g_sfec_d[l_ac].sfec002) THEN
                  NEXT FIELD sfec002
               END IF
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_sfec_d[l_ac].sfec002 != g_sfec_d_t.sfec002) THEN
                  CALL s_aqct300_chk_valid1(g_master.sfebsite,g_sfec_d[l_ac].sfec002,g_sfec_d[l_ac].sfec003,g_sfebdocno,g_master.sfebseq)
                       RETURNING l_success
                  IF NOT l_success THEN
                     LET g_sfec_d[l_ac].sfec002 = g_sfec_d_t.sfec002             
                     NEXT FIELD sfec002
                  END IF
                  CALL asrt340_01_qc_reference()
               END IF
            END IF  
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec002
            #add-point:ON CHANGE sfec002
            {<point name="input.g.page2.sfec002" />}
            #END add-point

         #----<<sfec003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec003
            #add-point:BEFORE FIELD sfec003
            CALL cl_set_comp_required("sfec002,sfec003",FALSE)
            IF g_master.sfeb002 = 'Y' THEN   #FQC否
               CALL cl_set_comp_required("sfec002,sfec003",TRUE)
            END IF 
            IF cl_null(g_sfec_d[l_ac].sfec003) THEN
               CALL asrt340_01_set_sfec003() 
            END IF   
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec003

            #add-point:AFTER FIELD sfec003
           IF g_master.sfeb002 = 'Y' THEN
              IF cl_null(g_sfec_d[l_ac].sfec003) THEN
                 NEXT FIELD sfec003
              END IF
             #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_sfec_d[l_ac].sfec003 != g_sfec_d_t.sfec003) THEN   #160824-00007#285 by sakura mark
              IF g_sfec_d[l_ac].sfec003 != g_sfec_d_o.sfec003 OR cl_null(g_sfec_d_o.sfec003) THEN      #160824-00007#285 by sakura add
                 CALL s_aqct300_chk_valid1(g_master.sfebsite,g_sfec_d[l_ac].sfec002,g_sfec_d[l_ac].sfec003,g_sfebdocno,g_master.sfebseq)
                      RETURNING l_success
                 IF NOT l_success THEN
                   #LET g_sfec_d[l_ac].sfec003 = g_sfec_d_t.sfec003   #160824-00007#285 by sakura mark
                    LET g_sfec_d[l_ac].sfec003 = g_sfec_d_o.sfec003   #160824-00007#285 by sakura add
                    NEXT FIELD sfec003
                 END IF
                 CALL asrt340_01_qc_reference()
              END IF
                 
#              SELECT * INTO l_qcbc.* FROM qcbc_t #161124-00048#21 mark
               #161124-00048#21 add(s)
               SELECT qcbcent,qcbcsite,qcbcdocno,qcbcseq,qcbc001,qcbc002,qcbc003,qcbc004,qcbc005,
                      qcbc006,qcbc007,qcbc008,qcbc009,qcbc010,qcbc011,qcbc012,qcbc013 
                 INTO l_qcbc.* FROM qcbc_t
               #161124-00048#21 add(e)
               WHERE qcbcent   = g_enterprise
                AND qcbcsite  = g_master.sfebsite
                AND qcbcdocno = g_sfec_d[l_ac].sfec002
                AND qcbcseq   = g_sfec_d[l_ac].sfec003
      
              #判定结果   
              LET g_sfec_d[l_ac].sfec003_desc1 = l_qcbc.qcbc002
              #判定结果说明
              LET g_sfec_d[l_ac].sfec003_desc2 = s_desc_get_qc_desc(g_master.sfebsite,g_sfec_d[l_ac].sfec003_desc1)
           END IF
           LET g_sfec_d_o.* = g_sfec_d[l_ac].*   #160824-00007#285 by sakura add           
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec003
            #add-point:ON CHANGE sfec003
            {<point name="input.g.page2.sfec003" />}
            #END add-point

         #----<<sfec004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec004
            #add-point:BEFORE FIELD sfec004
            IF g_master.sfeb002 = 'N' AND cl_null(g_sfec_d[l_ac].sfec004) THEN
               LET g_sfec_d[l_ac].sfec004 = g_master.sfeb003
            END IF
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec004

            #add-point:AFTER FIELD sfec004
            {<point name="input.a.page2.sfec004" />}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec004
            #add-point:ON CHANGE sfec004
            {<point name="input.g.page2.sfec004" />}
            #END add-point

         #----<<sfec005>>----
         #此段落由子樣板a02產生
         AFTER FIELD sfec005

            #add-point:AFTER FIELD sfec005

          {#ADP版次:1#}
            #END add-point


         #此段落由子樣板a01產生
         BEFORE FIELD sfec005
            #add-point:BEFORE FIELD sfec005
            IF g_master.sfeb002 = 'N' AND cl_null(g_sfec_d[l_ac].sfec005) THEN
               LET g_sfec_d[l_ac].sfec005 = g_master.sfeb004
               CALL s_desc_get_item_desc(g_sfec_d[l_ac].sfec005)
                    RETURNING g_sfec_d[l_ac].sfec005_desc1,g_sfec_d[l_ac].sfec005_desc2          
            END IF 
            #END add-point

         #此段落由子樣板a04產生
         ON CHANGE sfec005
            #add-point:ON CHANGE sfec005
            {<point name="input.g.page2.sfec005" />}
            #END add-point

         #----<<sfec006>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec006
            #add-point:BEFORE FIELD sfec006
            IF g_master.sfeb002 = 'N' AND cl_null(g_sfec_d[l_ac].sfec006) THEN
               LET g_sfec_d[l_ac].sfec006 = g_master.sfeb005
            END IF 
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec006

            #add-point:AFTER FIELD sfec006
            {<point name="input.a.page2.sfec006" />}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec006
            #add-point:ON CHANGE sfec006
            {<point name="input.g.page2.sfec006" />}
            #END add-point

         #----<<sfec007>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec007
            #add-point:BEFORE FIELD sfec007
            {<point name="input.b.page2.sfec007" />}
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec007

            #add-point:AFTER FIELD sfec007
            {<point name="input.a.page2.sfec007" />}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec007
            #add-point:ON CHANGE sfec007
            {<point name="input.g.page2.sfec007" />}
            #END add-point

         #----<<sfec008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec008
            #add-point:BEFORE FIELD sfec008
            {<point name="input.b.page2.sfec008" />}
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec008

            #add-point:AFTER FIELD sfec008
            {<point name="input.a.page2.sfec008" />}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec008
            #add-point:ON CHANGE sfec008
            {<point name="input.g.page2.sfec008" />}
            #END add-point

         #----<<sfec009>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec009
            #add-point:BEFORE FIELD sfec009
            IF g_master.sfeb002 = 'N' AND (cl_null(g_sfec_d[l_ac].sfec009) OR g_sfec_d[l_ac].sfec009 = 0 ) THEN
               LET g_sfec_d[l_ac].sfec009 = asrt340_01_get_sfec009()
            END IF 
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec009

            #add-point:AFTER FIELD sfec009
            IF NOT cl_null(g_sfec_d[l_ac].sfec009) THEN
               CALL asrt340_01_chk_sfec009()
                    RETURNING l_success
               IF NOT l_success THEN
                  LET g_sfec_d[l_ac].sfec009 = g_sfec_d_t.sfec009
                  NEXT FIELD sfec009            
               END IF
               CALL asrt340_01_set_sfec011()
               IF g_sfec_d[l_ac].sfec009 <> g_sfec_d_o.sfec009 OR cl_null(g_sfec_d_o.sfec009) THEN 
                  IF s_lot_batch_number(g_sfec_d[l_ac].sfec005,g_site) THEN 
                     IF g_master.sfeb002 = 'N' THEN
                        #資料抓取來源'1'代表從現有的製造批序號庫存明細檔inai_t中抓出資料供挑選
                        #           '2'代表從單據對應的申請資料inao_t中抓取出資料供挑選
                        #    資料類型:1.申請資料， 2.實際異動資料
                        CALL s_lot_sel('2','2',
                                       #營運據點 目的單據編號
                                       g_site,g_sfebdocno,
                                       #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳0)
                                       g_master.sfebseq,g_sfec_d[l_ac].sfecseq1,
                                       #料件編號                        產品特徵
                                       g_sfec_d[l_ac].sfec005,g_sfec_d[l_ac].sfec006,
                                       #庫存管理特徵                   庫位                    
                                       g_sfec_d[l_ac].sfec015,g_sfec_d[l_ac].sfec012,
                                       #儲位                          批號                     
                                       g_sfec_d[l_ac].sfec013,g_sfec_d[l_ac].sfec014,
                                       #交易單位                      交易數量                 
                                       g_sfec_d[l_ac].sfec008,g_sfec_d[l_ac].sfec009,
                                       #'入庫'  作業編號 營運據點
                                       '1',g_prog,g_site,
                                       #来源單據編號       来源單據項次
                                       g_sfebdocno,g_master.sfebseq,
                                       #来源單據項序(若單據沒有到項序層則此參數固定傳0)  启用来源单据
                                       '','1'
                                       )
                             RETURNING l_success
                     ELSE
                        #資料抓取來源'1'代表從現有的製造批序號庫存明細檔inai_t中抓出資料供挑選
                        #           '2'代表從單據對應的申請資料inao_t中抓取出資料供挑選
                        #    資料類型:1.申請資料， 2.實際異動資料
                        CALL s_lot_sel('2','2',
                                       #營運據點 目的單據編號
                                       g_site,g_sfebdocno,
                                       #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳0)
                                       g_master.sfebseq,g_sfec_d[l_ac].sfecseq1,
                                       #料件編號                        產品特徵
                                       g_sfec_d[l_ac].sfec005,g_sfec_d[l_ac].sfec006,
                                       #庫存管理特徵                   庫位                    
                                       g_sfec_d[l_ac].sfec015,g_sfec_d[l_ac].sfec012,
                                       #儲位                          批號                     
                                       g_sfec_d[l_ac].sfec013,g_sfec_d[l_ac].sfec014,
                                       #交易單位                      交易數量                 
                                       g_sfec_d[l_ac].sfec008,g_sfec_d[l_ac].sfec009,
                                       #'入庫'  作業編號 營運據點
                                       '1',g_prog,g_site,
                                       #来源單據編號       来源單據項次
                                       g_sfec_d[l_ac].sfec002,g_sfec_d[l_ac].sfec003,
                                       #来源單據項序(若單據沒有到項序層則此參數固定傳0)  启用来源单据
                                       '0','1'
                                       )
                             RETURNING l_success
                     END IF
                  END IF 
               END IF                 
            END IF
            LET g_sfec_d_o.sfec009 = g_sfec_d[l_ac].sfec009 
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec009
            #add-point:ON CHANGE sfec009
            {<point name="input.g.page2.sfec009" />}
            #END add-point

         #----<<sfec010>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec010
            #add-point:BEFORE FIELD sfec010
            {<point name="input.b.page2.sfec010" />}
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec010

            #add-point:AFTER FIELD sfec010
            {<point name="input.a.page2.sfec010" />}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec010
            #add-point:ON CHANGE sfec010
            {<point name="input.g.page2.sfec010" />}
            #END add-point

         #----<<sfec011>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec011
            #add-point:BEFORE FIELD sfec011
            IF g_master.sfeb002 = 'N' AND (cl_null(g_sfec_d[l_ac].sfec011) OR g_sfec_d[l_ac].sfec011 = 0 ) THEN
               LET g_sfec_d[l_ac].sfec011 = asrt340_01_get_sfec011()
            END IF  
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec011

            #add-point:AFTER FIELD sfec011
            IF NOT cl_null(g_sfec_d[l_ac].sfec011) THEN
               CALL asrt340_01_chk_sfec011()
                    RETURNING l_success
               IF NOT l_success THEN
                  LET g_sfec_d[l_ac].sfec011 = g_sfec_d_t.sfec011
                  NEXT FIELD sfec011            
               END IF
            END IF
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec011
            #add-point:ON CHANGE sfec011
            {<point name="input.g.page2.sfec011" />}
            #END add-point

         #----<<sfec012>>----
         #此段落由子樣板a02產生
         AFTER FIELD sfec012

            #add-point:AFTER FIELD sfec012
            LET g_sfec_d[l_ac].sfec012_desc = s_desc_get_stock_desc(g_site,g_sfec_d[l_ac].sfec012)
            IF cl_null(g_sfec_d[l_ac].sfec012) THEN
               NEXT FIELD sfec012
            END IF
            IF NOT cl_null(g_sfec_d[l_ac].sfec012) THEN 
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_sfec_d[l_ac].sfec012 != g_sfec_d_t.sfec012) THEN   #160824-00007#285 by sakura mark
               IF g_sfec_d[l_ac].sfec012 != g_sfec_d_o.sfec012 OR cl_null(g_sfec_d_o.sfec012) THEN      #160824-00007#285 by sakura add
                  #CALL asrt340_01_chk_warehouse()   #161006-00018#15 mark
                  CALL asrt340_01_chk_warehouse('1') #161006-00018#15 add
                       RETURNING l_success
                  IF NOT l_success THEN
                    #LET g_sfec_d[l_ac].sfec012 = g_sfec_d_t.sfec012   #160824-00007#285 by sakura mark
                     LET g_sfec_d[l_ac].sfec012 = g_sfec_d_o.sfec012   #160824-00007#285 by sakura add
                     #LET g_sfec_d[l_ac].sfec013 = g_sfec_d_t.sfec013  #161006-00018#15 mark
                     #LET g_sfec_d[l_ac].sfec014 = g_sfec_d_t.sfec014  #161006-00018#15 mark                    
                     NEXT FIELD sfec012
                  END IF
                  LET g_sfec_d[l_ac].sfec013 = ''
                  LET g_sfec_d[l_ac].sfec013_desc=''
               END IF               
               IF g_sfec_d[l_ac].sfec012 != g_sfec_d_o.sfec012 OR cl_null(g_sfec_d_o.sfec012) OR
                  g_sfec_d[l_ac].sfec013 != g_sfec_d_o.sfec013 OR g_sfec_d_o.sfec013 IS NULL OR 
                  g_sfec_d[l_ac].sfec014 != g_sfec_d_o.sfec014 OR g_sfec_d_o.sfec014 IS NULL THEN 
                  CALL s_lot_upd_inao(g_sfebdocno,g_master.sfebseq,g_sfec_d[l_ac].sfecseq1,'2',g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013,g_sfec_d[l_ac].sfec014,g_site,g_sfec_d[l_ac].sfec015)    #160316-00007#1 add  sfec015
                     RETURNING l_success
               END IF                
            END IF
            LET g_sfec_d_o.* = g_sfec_d[l_ac].*   #160824-00007#285 by sakura add
            #160824-00007#285 by sakura mark(S)
            #LET g_sfec_d_o.sfec012 = g_sfec_d[l_ac].sfec012
            #LET g_sfec_d_o.sfec013 = g_sfec_d[l_ac].sfec013
            #LET g_sfec_d_o.sfec014 = g_sfec_d[l_ac].sfec014
            #160824-00007#285 by sakura mark(E)
            
            #END add-point


         #此段落由子樣板a01產生
         BEFORE FIELD sfec012
            #add-point:BEFORE FIELD sfec012
            IF g_master.sfeb002 = 'N' AND cl_null(g_sfec_d[l_ac].sfec012) THEN
               LET g_sfec_d[l_ac].sfec012 = g_master.sfeb013
            END IF
            LET g_sfec_d[l_ac].sfec012_desc = s_desc_get_stock_desc(g_site,g_sfec_d[l_ac].sfec012)            
            #END add-point

         #此段落由子樣板a04產生
         ON CHANGE sfec012
            #add-point:ON CHANGE sfec012
            {<point name="input.g.page2.sfec012" />}
            #END add-point

         #----<<sfec013>>----
         #此段落由子樣板a02產生
         AFTER FIELD sfec013

            #add-point:AFTER FIELD sfec013
            LET g_sfec_d[l_ac].sfec013_desc = s_desc_get_locator_desc(g_site,g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013) 
            IF g_sfec_d[l_ac].sfec013 IS NULL THEN
               LET g_sfec_d[l_ac].sfec013 = ' '
            END IF
            IF g_sfec_d[l_ac].sfec013 IS NOT NULL THEN            
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_sfec_d[l_ac].sfec013 != g_sfec_d_t.sfec013) THEN   #160824-00007#285 by sakura mark
               IF g_sfec_d[l_ac].sfec013 != g_sfec_d_o.sfec013 OR cl_null(g_sfec_d_o.sfec013) THEN      #160824-00007#285 by sakura add
                  #CALL asrt340_01_chk_warehouse()   #161006-00018#15 mark
                  CALL asrt340_01_chk_warehouse('2') #161006-00018#15 add
                       RETURNING l_success
                  IF NOT l_success THEN
                     #LET g_sfec_d[l_ac].sfec012 = g_sfec_d_t.sfec012  #161006-00018#15 mark
                    #LET g_sfec_d[l_ac].sfec013 = g_sfec_d_t.sfec013   #160824-00007#285 by sakura mark
                     LET g_sfec_d[l_ac].sfec013 = g_sfec_d_o.sfec013   #160824-00007#285 by sakura add
                     #LET g_sfec_d[l_ac].sfec014 = g_sfec_d_t.sfec014  #161006-00018#15 mark               
                     NEXT FIELD sfec013
                  END IF
               END IF               
               IF g_sfec_d[l_ac].sfec012 != g_sfec_d_o.sfec012 OR cl_null(g_sfec_d_o.sfec012) OR
                  g_sfec_d[l_ac].sfec013 != g_sfec_d_o.sfec013 OR g_sfec_d_o.sfec013 IS NULL OR 
                  g_sfec_d[l_ac].sfec014 != g_sfec_d_o.sfec014 OR g_sfec_d_o.sfec014 IS NULL THEN 
                  CALL s_lot_upd_inao(g_sfebdocno,g_master.sfebseq,g_sfec_d[l_ac].sfecseq1,'2',g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013,g_sfec_d[l_ac].sfec014,g_site,g_sfec_d[l_ac].sfec015)    #160316-00007#1 add  sfec015
                     RETURNING l_success
               END IF              
            END IF
            LET g_sfec_d_o.* = g_sfec_d[l_ac].*   #160824-00007#285 by sakura add
            #160824-00007#285 by sakura mark(S)
            #LET g_sfec_d_o.sfec012 = g_sfec_d[l_ac].sfec012
            #LET g_sfec_d_o.sfec013 = g_sfec_d[l_ac].sfec013
            #LET g_sfec_d_o.sfec014 = g_sfec_d[l_ac].sfec014
            #160824-00007#285 by sakura mark(E)
          {#ADP版次:1#}
            #END add-point


         #此段落由子樣板a01產生
         BEFORE FIELD sfec013
            #add-point:BEFORE FIELD sfec013
            IF g_master.sfeb002 = 'N' AND g_sfec_d[l_ac].sfec012 IS NULL THEN
               LET g_sfec_d[l_ac].sfec013 = g_master.sfeb014
            END IF
            LET g_sfec_d[l_ac].sfec013_desc = s_desc_get_locator_desc(g_site,g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013)             
            DISPLAY g_sfec_d[l_ac].sfec013 TO sfec013             #161006-00018#15  
            DISPLAY g_sfec_d[l_ac].sfec013_desc TO sfec013_desc   #161006-00018#15
            #END add-point

         #此段落由子樣板a04產生
         ON CHANGE sfec013
            #add-point:ON CHANGE sfec013
            {<point name="input.g.page2.sfec013" />}
            #END add-point

         #----<<sfec014>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec014
            #add-point:BEFORE FIELD sfec014
            IF g_sfec_d[l_ac].sfec014 IS NULL THEN
               LET g_sfec_d[l_ac].sfec014 = g_master.sfeb015
            END IF
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec014

            #add-point:AFTER FIELD sfec014
            IF g_sfec_d[l_ac].sfec014 IS NULL THEN
               LET g_sfec_d[l_ac].sfec014 = ' '
            END IF 
            IF g_sfec_d[l_ac].sfec014 IS NOT NULL THEN            
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_sfec_d[l_ac].sfec014 != g_sfec_d_t.sfec014) THEN   #160824-00007#285 by sakura mark
               IF g_sfec_d[l_ac].sfec014 != g_sfec_d_o.sfec014 OR cl_null(g_sfec_d_o.sfec014) THEN      #160824-00007#285 by sakura add
                  #CALL asrt340_01_chk_warehouse()   #161006-00018#15 mark
                  CALL asrt340_01_chk_warehouse('3') #161006-00018#15 add
                       RETURNING l_success
                  IF NOT l_success THEN
                        #LET g_sfec_d[l_ac].sfec012 = g_sfec_d_t.sfec012  #161006-00018#15 mark
                        #LET g_sfec_d[l_ac].sfec013 = g_sfec_d_t.sfec013  #161006-00018#15 mark
                       #LET g_sfec_d[l_ac].sfec014 = g_sfec_d_t.sfec014   #160824-00007#285 by sakura mark
                        LET g_sfec_d[l_ac].sfec014 = g_sfec_d_o.sfec014   #160824-00007#285 by sakura add
                     NEXT FIELD sfec012
                  END IF
               END IF               
               IF g_sfec_d[l_ac].sfec012 != g_sfec_d_o.sfec012 OR cl_null(g_sfec_d_o.sfec012) OR
                  g_sfec_d[l_ac].sfec013 != g_sfec_d_o.sfec013 OR g_sfec_d_o.sfec013 IS NULL OR 
                  g_sfec_d[l_ac].sfec014 != g_sfec_d_o.sfec014 OR g_sfec_d_o.sfec014 IS NULL THEN 
                  CALL s_lot_upd_inao(g_sfebdocno,g_master.sfebseq,g_sfec_d[l_ac].sfecseq1,'2',g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013,g_sfec_d[l_ac].sfec014,g_site,g_sfec_d[l_ac].sfec015)     #160316-00007#1 add  sfec015
                     RETURNING l_success
               END IF              
            END IF
            LET g_sfec_d_o.* = g_sfec_d[l_ac].*   #160824-00007#285 by sakura add
            #160824-00007#285 by sakura mark(S)
            #LET g_sfec_d_o.sfec012 = g_sfec_d[l_ac].sfec012
            #LET g_sfec_d_o.sfec013 = g_sfec_d[l_ac].sfec013
            #LET g_sfec_d_o.sfec014 = g_sfec_d[l_ac].sfec014
            #160824-00007#285 by sakura mark(E)
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec014
            #add-point:ON CHANGE sfec014
            {<point name="input.g.page2.sfec014" />}
            #END add-point

         #----<<sfec015>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec015
            #add-point:BEFORE FIELD sfec015
            IF NOT cl_null(g_sfec_d[l_ac].sfec015) THEN
               LET g_sfec_d[l_ac].sfec015 = g_master.sfeb016
            END IF 
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec015

            #add-point:AFTER FIELD sfec015
            #160316-00007#---add---begin
            IF g_sfec_d[l_ac].sfec015 IS NULL THEN
               LET g_sfec_d[l_ac].sfec015 = ' '
            END IF 
            IF g_sfec_d[l_ac].sfec015 IS NOT NULL THEN            
               IF g_sfec_d[l_ac].sfec015 != g_sfec_d_o.sfec015 OR g_sfec_d_o.sfec015 IS NULL THEN 
                  CALL s_lot_upd_inao(g_sfebdocno,g_master.sfebseq,g_sfec_d[l_ac].sfecseq1,'2',g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013,g_sfec_d[l_ac].sfec014,g_site,g_sfec_d[l_ac].sfec015)     
                     RETURNING l_success
               END IF              
            END IF    
            LET g_sfec_d_o.sfec015 = g_sfec_d[l_ac].sfec015
            #160316-00007#---add---end
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec015
            #add-point:ON CHANGE sfec015
            {<point name="input.g.page2.sfec015" />}
            #END add-point

         #----<<sfec016>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec016
            #add-point:BEFORE FIELD sfec016
            IF NOT cl_null(g_sfec_d[l_ac].sfec016) THEN
               LET g_sfec_d[l_ac].sfec016 = g_master.sfeb021
            END IF 
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfec016

            #add-point:AFTER FIELD sfec016
            {<point name="input.a.page2.sfec016" />}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec016
            #add-point:ON CHANGE sfec016
            {<point name="input.g.page2.sfec016" />}
            #END add-point

         #----<<sfec017>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfec017
            IF NOT cl_null(g_sfec_d[l_ac].sfec017) THEN
               LET g_sfec_d[l_ac].sfec017 = g_master.sfeb022
            END IF

         #此段落由子樣板a02產生
         AFTER FIELD sfec017

            #add-point:AFTER FIELD sfec017
            {<point name="input.a.page2.sfec017" />}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfec017
            #add-point:ON CHANGE sfec017
            {<point name="input.g.page2.sfec017" />}
            #END add-point

         #----<<sfecsite>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfecsite
            #add-point:BEFORE FIELD sfecsite
            {<point name="input.b.page2.sfecsite" />}
            #END add-point

         #此段落由子樣板a02產生
         AFTER FIELD sfecsite

            #add-point:AFTER FIELD sfecsite
            {<point name="input.a.page2.sfecsite" />}
            #END add-point


         #此段落由子樣板a04產生
         ON CHANGE sfecsite
            #add-point:ON CHANGE sfecsite
            {<point name="input.g.page2.sfecsite" />}
            #END add-point


         #---------------------<  Detail: page2  >---------------------
         #----<<sfecseq1>>----
         #Ctrlp:input.c.page2.sfecseq1
#         ON ACTION controlp INFIELD sfecseq1
            #add-point:ON ACTION controlp INFIELD sfecseq1
            {<point name="input.c.page2.sfecseq1" />}
            #END add-point

         #----<<sfec001>>----
         #Ctrlp:input.c.page2.sfec001
#         ON ACTION controlp INFIELD sfec001
            #add-point:ON ACTION controlp INFIELD sfec001
            {<point name="input.c.page2.sfec001" />}
            #END add-point

         #----<<sfec002>>----
         #Ctrlp:input.c.page2.sfec002
         ON ACTION controlp INFIELD sfec002
            #add-point:ON ACTION controlp INFIELD sfec002
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfec_d[l_ac].sfec002
            LET g_qryparam.arg1 = g_sfebdocno
            LET g_qryparam.arg2 = g_master.sfebseq
            CALL q_qcbc()
            LET g_sfec_d[l_ac].sfec002 = g_qryparam.return1     #將開窗取得的值>
            NEXT FIELD sfec002
            #END add-point

         #----<<sfec003>>----
         #Ctrlp:input.c.page2.sfec003
         ON ACTION controlp INFIELD sfec003
            #add-point:ON ACTION controlp INFIELD sfec003
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfec_d[l_ac].sfec003
            LET g_qryparam.arg1 = g_sfebdocno            
            CALL q_qcbcseq()
            LET g_sfec_d[l_ac].sfec003 = g_qryparam.return1     #將開窗取得的值>
            NEXT FIELD sfec003
            #END add-point

         #----<<sfec004>>----
         #Ctrlp:input.c.page2.sfec004
#         ON ACTION controlp INFIELD sfec004
            #add-point:ON ACTION controlp INFIELD sfec004
            {<point name="input.c.page2.sfec004" />}
            #END add-point

         #----<<sfec005>>----
         #Ctrlp:input.c.page2.sfec005
#         ON ACTION controlp INFIELD sfec005
            #add-point:ON ACTION controlp INFIELD sfec005
            {<point name="input.c.page2.sfec005" />}
            #END add-point

         #----<<sfec006>>----
         #Ctrlp:input.c.page2.sfec006
#         ON ACTION controlp INFIELD sfec006
            #add-point:ON ACTION controlp INFIELD sfec006
            {<point name="input.c.page2.sfec006" />}
            #END add-point

         #----<<sfec007>>----
         #Ctrlp:input.c.page2.sfec007
#         ON ACTION controlp INFIELD sfec007
            #add-point:ON ACTION controlp INFIELD sfec007
            {<point name="input.c.page2.sfec007" />}
            #END add-point

         #----<<sfec008>>----
         #Ctrlp:input.c.page2.sfec008
#         ON ACTION controlp INFIELD sfec008
            #add-point:ON ACTION controlp INFIELD sfec008
            {<point name="input.c.page2.sfec008" />}
            #END add-point

         #----<<sfec009>>----
         #Ctrlp:input.c.page2.sfec009
#         ON ACTION controlp INFIELD sfec009
            #add-point:ON ACTION controlp INFIELD sfec009
            {<point name="input.c.page2.sfec009" />}
            #END add-point

         #----<<sfec010>>----
         #Ctrlp:input.c.page2.sfec010
#         ON ACTION controlp INFIELD sfec010
            #add-point:ON ACTION controlp INFIELD sfec010
            {<point name="input.c.page2.sfec010" />}
            #END add-point

         #----<<sfec011>>----
         #Ctrlp:input.c.page2.sfec011
#         ON ACTION controlp INFIELD sfec011
            #add-point:ON ACTION controlp INFIELD sfec011
            {<point name="input.c.page2.sfec011" />}
            #END add-point

         #----<<sfec012>>----
         #Ctrlp:input.c.page2.sfec012
          ON ACTION controlp INFIELD sfec012
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfec_d[l_ac].sfec012
            IF g_master.sfeb002 = 'N' THEN
               CALL q_inaa001_2()
            ELSE
               #1.取出参照表号
               SELECT ooef025 INTO l_ooef025 FROM ooef_t
                WHERE ooefent = g_enterprise
                  AND ooef001 = g_master.sfebsite
               #2.取判定结果 g_sfec_d[l_ac].qcbc002
               #3.取aqci020中的仓库属性设置
               SELECT qcao005,qcao006,qcao007 INTO l_qcao005,l_qcao006,l_qcao007
                 FROM qcao_t
                WHERE qcaoent = g_enterprise
                  AND qcao001 = l_ooef025
                  AND qcao002 = g_sfec_d[l_ac].sfec003_desc1
               IF cl_null(l_qcao005) THEN LET l_qcao005 = 'Y' END IF
               IF cl_null(l_qcao006) THEN LET l_qcao006 = 'Y' END IF
               IF cl_null(l_qcao007) THEN LET l_qcao007 = 'Y' END IF           
               LET g_qryparam.arg1 = g_master.sfebsite
               LET g_qryparam.arg2 = l_qcao006
               LET g_qryparam.arg3 = l_qcao007
               LET g_qryparam.arg4 = l_qcao005          
               CALL q_inaa001_11()               
            END IF
            LET g_sfec_d[l_ac].sfec012 = g_qryparam.return1    
            NEXT FIELD sfec012 
            #END add-point

         #----<<sfec013>>----
         #Ctrlp:input.c.page2.sfec013
         ON ACTION controlp INFIELD sfec013
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfec_d[l_ac].sfec013
            LET g_qryparam.arg1 = g_sfec_d[l_ac].sfec012
            CALL q_inab002_3()
            LET g_sfec_d[l_ac].sfec013 = g_qryparam.return1     #將開窗取得的值回傳到變數  
            NEXT FIELD sfec013
         

            #END add-point

         #----<<sfec014>>----
         #Ctrlp:input.c.page2.sfec014
#         ON ACTION controlp INFIELD sfec014
            #add-point:ON ACTION controlp INFIELD sfec014
            {<point name="input.c.page2.sfec014" />}
            #END add-point

         #----<<sfec015>>----
         #Ctrlp:input.c.page2.sfec015
#         ON ACTION controlp INFIELD sfec015
            #add-point:ON ACTION controlp INFIELD sfec015
            {<point name="input.c.page2.sfec015" />}
            #END add-point

         #----<<sfec016>>----
         #Ctrlp:input.c.page2.sfec016
#         ON ACTION controlp INFIELD sfec016
            #add-point:ON ACTION controlp INFIELD sfec016
            {<point name="input.c.page2.sfec016" />}
            #END add-point

         #----<<sfec017>>----
         #Ctrlp:input.c.page2.sfec017
#         ON ACTION controlp INFIELD sfec017
            #add-point:ON ACTION controlp INFIELD sfec017
            {<point name="input.c.page2.sfec017" />}
            #END add-point

         #----<<sfecsite>>----
         #Ctrlp:input.c.page2.sfecsite
#         ON ACTION controlp INFIELD sfecsite
            #add-point:ON ACTION controlp INFIELD sfecsite
            {<point name="input.c.page2.sfecsite" />}
            #END add-point



         AFTER ROW
            LET l_ac = ARR_CURR()
            LET l_ac_t = l_ac
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sfec_d[l_ac].* = g_sfec_d_t.*
               END IF
               CLOSE asrt340_01_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG
            END IF

            #其他table進行unlock


            CALL asrt340_01_unlock_b("sfec_t")
            CALL s_transaction_end('Y','0')
            CALL asrt340_01_b_fill(g_wc)


         AFTER INPUT
            #add-point:input段after input
            {<point name="input.body2.after_input"/>}
            #end add-point

      END INPUT







      #add-point:input段input_array"
      {<point name="input.more_inputarray"/>}
      #end add-point

      BEFORE DIALOG
         LET g_curr_diag = ui.DIALOG.getCurrent()
         IF g_master_idx > 0 THEN
            IF g_master_idx > g_sfeb_d.getLength() THEN
               LET g_master_idx = g_sfeb_d.getLength()
            END IF
            CALL DIALOG.setCurrentRow("s_detail1", g_master_idx)
            LET l_ac = g_master_idx
         END IF
         LET g_master_idx = l_ac
         #add-point:input段input_array"
         {<point name="input.before_dialog"/>}
         #end add-point

      ON ACTION accept
         ACCEPT DIALOG

      ON ACTION cancel
         LET INT_FLAG = TRUE
         EXIT DIALOG

      ON ACTION close
         LET INT_FLAG = TRUE
         EXIT DIALOG

      ON ACTION controlo
         DISPLAY "Controlo"

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

   #add-point:input段修改後
   {<point name="input.after_input"/>}
   #end add-point

   CLOSE asrt340_01_bcl
   CALL s_transaction_end('Y','0')

END FUNCTION

PRIVATE FUNCTION asrt340_01_b_fill(p_wc2)
   {<Local define>}
   DEFINE p_wc2           STRING
   DEFINE l_cnt           LIKE type_t.num5
   {</Local define>}
   #add-point:b_fill段define
   {<point name="b_fill.define"/>}
   #end add-point

   #add-point:b_fill段sql_before
   LET p_wc2 = " sfebdocno = '",g_sfebdocno,"'" 
   #end add-point

   LET g_sql = "SELECT  UNIQUE sfebdocno,sfebseq,sfeb023,'','',sfeb024,sfeb025,sfeb002,sfeb003,sfeb004,'','',sfeb005,sfeb006, 
       sfeb007,sfeb008,sfeb027,sfeb009,sfeb010,sfeb011,sfeb012,sfeb013,'',sfeb014,'',sfeb015,sfeb016,sfeb017, 
       sfeb018,sfeb019,sfeb020,sfeb021,sfeb022,sfebsite FROM sfeb_t",
 
               " LEFT JOIN sfec_t ON sfecent = sfebent AND sfebdocno = sfecdocno AND sfebseq = sfecseq",
 
 
               "",
               " WHERE sfebent= ? AND 1=1 AND ", p_wc2
    
   LET g_sql = g_sql, " ORDER BY sfeb_t.sfebdocno,sfeb_t.sfebseq"


   #add-point:b_fill段sql_after
   {<point name="b_fill.sql_after"/>}
   #end add-point

   PREPARE asrt340_01_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR asrt340_01_pb

   OPEN b_fill_curs USING g_enterprise

   CALL g_sfeb_d.clear()
   CALL g_sfec_d.clear()



   LET g_cnt = l_ac
   LET l_ac = 1
   ERROR "Searching!"

   FOREACH b_fill_curs INTO g_sfeb_d[l_ac].sfebdocno,g_sfeb_d[l_ac].sfebseq,g_sfeb_d[l_ac].sfeb023,
       g_sfeb_d[l_ac].sfeb023_desc1,g_sfeb_d[l_ac].sfeb023_desc2,g_sfeb_d[l_ac].sfeb024,g_sfeb_d[l_ac].sfeb025,
       g_sfeb_d[l_ac].sfeb002, 
       g_sfeb_d[l_ac].sfeb003,g_sfeb_d[l_ac].sfeb004,g_sfeb_d[l_ac].sfeb004_desc1,g_sfeb_d[l_ac].sfeb004_desc2, 
       g_sfeb_d[l_ac].sfeb005,g_sfeb_d[l_ac].sfeb006,g_sfeb_d[l_ac].sfeb007,g_sfeb_d[l_ac].sfeb008,
       g_sfeb_d[l_ac].sfeb027,g_sfeb_d[l_ac].sfeb009, 
       g_sfeb_d[l_ac].sfeb010,g_sfeb_d[l_ac].sfeb011,g_sfeb_d[l_ac].sfeb012,g_sfeb_d[l_ac].sfeb013,g_sfeb_d[l_ac].sfeb013_desc, 
       g_sfeb_d[l_ac].sfeb014,g_sfeb_d[l_ac].sfeb014_desc,g_sfeb_d[l_ac].sfeb015,g_sfeb_d[l_ac].sfeb016, 
       g_sfeb_d[l_ac].sfeb017,g_sfeb_d[l_ac].sfeb018,g_sfeb_d[l_ac].sfeb019,g_sfeb_d[l_ac].sfeb020,g_sfeb_d[l_ac].sfeb021, 
       g_sfeb_d[l_ac].sfeb022,g_sfeb_d[l_ac].sfebsite
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

      #add-point:b_fill段資料填充
      {<point name="b_fill.fill"/>}
      #end add-point
      #品名/规格
      CALL s_desc_get_item_desc(g_sfeb_d[l_ac].sfeb023) 
           RETURNING g_sfeb_d[l_ac].sfeb023_desc1,g_sfeb_d[l_ac].sfeb023_desc2      
      CALL s_desc_get_item_desc(g_sfeb_d[l_ac].sfeb004) 
           RETURNING g_sfeb_d[l_ac].sfeb004_desc1,g_sfeb_d[l_ac].sfeb004_desc2
      #仓库
      LET g_sfeb_d[l_ac].sfeb013_desc = s_desc_get_stock_desc(g_site,g_sfeb_d[l_ac].sfeb013) 
      #储位
      LET g_sfeb_d[l_ac].sfeb014_desc = s_desc_get_locator_desc(g_site,g_sfeb_d[l_ac].sfeb013,g_sfeb_d[l_ac].sfeb014)

      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ""
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

   END FOREACH
   LET g_error_show = 0

   LET l_cnt = g_sfeb_d.getLength()
   CALL g_sfeb_d.deleteElement(l_cnt)

   LET g_detail_cnt = l_ac - 1
   LET g_detail_idx = g_detail_cnt
   DISPLAY g_detail_cnt TO FORMONLY.cnt
   LET l_ac = g_cnt
   LET g_cnt = 0

   CLOSE b_fill_curs
   FREE asrt340_01_pb

   LET l_ac = 1
   CALL asrt340_01_fetch()

END FUNCTION

PRIVATE FUNCTION asrt340_01_fetch()
   {<Local define>}
   DEFINE li_ac           LIKE type_t.num5
   {</Local define>}
   #add-point:fetch段define
   {<point name="fetch.define"/>}
   #end add-point

   CALL g_sfec_d.clear()



   LET li_ac = l_ac

   LET g_sql = "SELECT  UNIQUE sfecseq1,sfec001,sfec002,sfec003,'','',sfec004,sfec005,'','',sfec006, 
       sfec007,sfec008,sfec009,sfec010,sfec011,sfec012,'',sfec013,'',sfec014,sfec015,sfec016,sfec018,sfec019,sfec020,sfec017, 
       sfecsite FROM sfec_t",    
               "",
               " WHERE sfecent=? AND sfecdocno=? AND sfecseq=?"
 
   IF NOT cl_null(g_wc2_table2) THEN
      LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
   END IF
 
   LET g_sql = g_sql, " ORDER BY sfec_t.sfecseq1" 


   #add-point:單身填充前
   {<point name="fetch.before_fill" />}
   #end add-point

   PREPARE asrt340_01_pb2 FROM g_sql
   DECLARE b_fill_curs2 CURSOR FOR asrt340_01_pb2

   OPEN b_fill_curs2 USING g_enterprise,g_master.sfebdocno
                                  ,g_master.sfebseq


   LET l_ac = 1
   FOREACH b_fill_curs2 INTO g_sfec_d[l_ac].sfecseq1,g_sfec_d[l_ac].sfec001,g_sfec_d[l_ac].sfec002, 
       g_sfec_d[l_ac].sfec003,g_sfec_d[l_ac].sfec003_desc1,g_sfec_d[l_ac].sfec003_desc2,g_sfec_d[l_ac].sfec004,
       g_sfec_d[l_ac].sfec005,g_sfec_d[l_ac].sfec005_desc1,g_sfec_d[l_ac].sfec005_desc2,g_sfec_d[l_ac].sfec006, 
       g_sfec_d[l_ac].sfec007,g_sfec_d[l_ac].sfec008,g_sfec_d[l_ac].sfec009,g_sfec_d[l_ac].sfec010, 
       g_sfec_d[l_ac].sfec011,g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec012_desc,g_sfec_d[l_ac].sfec013, 
       g_sfec_d[l_ac].sfec013_desc,g_sfec_d[l_ac].sfec014,g_sfec_d[l_ac].sfec015,g_sfec_d[l_ac].sfec016, 
       g_sfec_d[l_ac].sfec018,g_sfec_d[l_ac].sfec019,g_sfec_d[l_ac].sfec020,
       g_sfec_d[l_ac].sfec017,g_sfec_d[l_ac].sfecsite

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

      #品名/规格
      CALL s_desc_get_item_desc(g_sfec_d[l_ac].sfec005)
           RETURNING g_sfec_d[l_ac].sfec005_desc1,g_sfec_d[l_ac].sfec005_desc2
      SELECT qcbc002 INTO g_sfec_d[l_ac].sfec003_desc1 FROM qcbc_t
          WHERE qcbcent   = g_enterprise
            AND qcbcsite  = g_master.sfebsite
            AND qcbcdocno = g_sfec_d[l_ac].sfec002
            AND qcbcseq   = g_sfec_d[l_ac].sfec003
           
      #判定结果说明
      LET g_sfec_d[l_ac].sfec003_desc2 = s_desc_get_qc_desc(g_master.sfebsite,g_sfec_d[l_ac].sfec003_desc1)
      #仓库
      LET g_sfec_d[l_ac].sfec012_desc = s_desc_get_stock_desc(g_site,g_sfec_d[l_ac].sfec012) 
      #储位
      LET g_sfec_d[l_ac].sfec013_desc = s_desc_get_locator_desc(g_site,g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013) 
      
      #add-point:b_fill段資料填充
      {<point name="fetch.fill2"/>}
      #end add-point

      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         EXIT FOREACH
      END IF

   END FOREACH



   #add-point:單身填充後
   {<point name="fetch.after_fill" />}
   #end add-point

   CALL g_sfec_d.deleteElement(g_sfec_d.getLength())



   LET l_ac = li_ac

END FUNCTION

PRIVATE FUNCTION asrt340_01_detail_show()
   #add-point:show段define
   #   DEFINE  l_qcbc          RECORD LIKE qcbc_t.*    #161124-00048#21 mark
   #161124-00048#21 add(s)
   DEFINE l_qcbc RECORD  #品質檢驗判定結果檔
       qcbcent LIKE qcbc_t.qcbcent, #企业编号
       qcbcsite LIKE qcbc_t.qcbcsite, #营运据点
       qcbcdocno LIKE qcbc_t.qcbcdocno, #单号
       qcbcseq LIKE qcbc_t.qcbcseq, #行序
       qcbc001 LIKE qcbc_t.qcbc001, #类型
       qcbc002 LIKE qcbc_t.qcbc002, #判定结果编号
       qcbc003 LIKE qcbc_t.qcbc003, #料件编号
       qcbc004 LIKE qcbc_t.qcbc004, #产品特征
       qcbc005 LIKE qcbc_t.qcbc005, #库位
       qcbc006 LIKE qcbc_t.qcbc006, #储位
       qcbc007 LIKE qcbc_t.qcbc007, #批号
       qcbc008 LIKE qcbc_t.qcbc008, #单位
       qcbc009 LIKE qcbc_t.qcbc009, #判定数量
       qcbc010 LIKE qcbc_t.qcbc010, #已入库数
       qcbc011 LIKE qcbc_t.qcbc011, #库存备注
       qcbc012 LIKE qcbc_t.qcbc012, #判定区分
       qcbc013 LIKE qcbc_t.qcbc013  #处理方式
END RECORD
   #161124-00048#21 add(e)
   #end add-point

   #add-point:detail_show段之前
   {<point name="detail_show.before"/>}
   #end add-point



   #帶出公用欄位reference值page1
   IF g_flag = '1' THEN
      #品名/规格
      CALL s_desc_get_item_desc(g_sfeb_d[l_ac].sfeb004) 
           RETURNING g_sfeb_d[l_ac].sfeb004_desc1,g_sfeb_d[l_ac].sfeb004_desc2
      #仓库
      LET g_sfeb_d[l_ac].sfeb013_desc = s_desc_get_stock_desc(g_site,g_sfeb_d[l_ac].sfeb013) 
      #储位
      LET g_sfeb_d[l_ac].sfeb014_desc = s_desc_get_locator_desc(g_site,g_sfeb_d[l_ac].sfeb013,g_sfeb_d[l_ac].sfeb014)
     
   ELSE
      #品名/规格
      CALL s_desc_get_item_desc(g_sfec_d[l_ac].sfec005)
           RETURNING g_sfec_d[l_ac].sfec005_desc1,g_sfec_d[l_ac].sfec005_desc2
#     SELECT * INTO l_qcbc.* FROM qcbc_t #161124-00048#21 mark
      #161124-00048#21 add(s)
      SELECT qcbcent,qcbcsite,qcbcdocno,qcbcseq,qcbc001,qcbc002,qcbc003,qcbc004,qcbc005,
             qcbc006,qcbc007,qcbc008,qcbc009,qcbc010,qcbc011,qcbc012,qcbc013 
        INTO l_qcbc.* FROM qcbc_t
      #161124-00048#21 add(e)
       WHERE qcbcent   = g_enterprise
         AND qcbcsite  = g_master.sfebsite
         AND qcbcdocno = g_sfec_d[l_ac].sfec002
         AND qcbcseq   = g_sfec_d[l_ac].sfec003
      
      #判定结果   
      LET g_sfec_d[l_ac].sfec003_desc1 = l_qcbc.qcbc002
      #判定结果说明
      LET g_sfec_d[l_ac].sfec003_desc2 = s_desc_get_qc_desc(g_master.sfebsite,g_sfec_d[l_ac].sfec003_desc1)
      #仓库
      LET g_sfec_d[l_ac].sfec012_desc = s_desc_get_stock_desc(g_site,g_sfec_d[l_ac].sfec012) 
      #储位
      LET g_sfec_d[l_ac].sfec013_desc = s_desc_get_locator_desc(g_site,g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013)      
   END IF


   #帶出公用欄位reference值page2




   #讀入ref值
   #add-point:show段單身reference
   {<point name="detail_show.body.reference"/>}
   #end add-point

   #add-point:show段單身reference
   {<point name="detail_show.body2.reference"/>}
   #end add-point



   #add-point:detail_show段之後
   {<point name="detail_show.after"/>}
   #end add-point

END FUNCTION

PRIVATE FUNCTION asrt340_01_set_entry_b(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1
   {</Local define>}
   #add-point:set_entry_b段define
   {<point name="set_entry_b.define"/>}
   #end add-point

   #add-point:set_entry段欄位控制後
   CALL cl_set_comp_entry("sfec002,sfec003",TRUE)
   CALL cl_set_comp_entry("sfec012,sfec013,sfec014",TRUE)    #161006-00018#15
   #end add-point

END FUNCTION

PRIVATE FUNCTION asrt340_01_set_no_entry_b(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1
   DEFINE l_success  LIKE type_t.num5      #161006-00018#15
   DEFINE l_ooba002   LIKE ooba_t.ooba002  #161006-00018#15
   DEFINE l_mfg_0085  LIKE type_t.chr1     #161006-00018#15    
   {</Local define>}
   #add-point:set_no_entry_b段define
   {<point name="set_no_entry_b.define"/>}
   #end add-point

   #add-point:set_no_entry段欄位控制後
   IF g_master.sfeb002 = 'N' THEN
      CALL cl_set_comp_entry("sfec002,sfec003",FALSE)
   END IF
   #161006-00018#15---add---s
   LET l_ooba002 = ''
   CALL s_aooi200_get_slip(g_master.sfebdocno) RETURNING l_success,l_ooba002
   CALL cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0085') RETURNING l_mfg_0085 
   IF l_mfg_0085 <> 'Y' THEN
      IF NOT cl_null(g_master.sfeb013) THEN 
         CALL cl_set_comp_entry("sfec012",FALSE)
      END IF
      IF NOT cl_null(g_master.sfeb014) THEN 
         CALL cl_set_comp_entry("sfec013",FALSE)
      END IF 
      IF NOT cl_null(g_master.sfeb015) THEN 
         CALL cl_set_comp_entry("sfec014",FALSE)
      END IF       
   END IF   
   #161006-00018#15---add---e   
   #end add-point

END FUNCTION

PRIVATE FUNCTION asrt340_01_default_search()
   {<Local define>}
   DEFINE li_idx  LIKE type_t.num5
   DEFINE li_cnt  LIKE type_t.num5
   DEFINE ls_wc   STRING
   {</Local define>}
   #add-point:default_search段define
   {<point name="default_search.define"/>}
   #end add-point

   LET ls_wc = ls_wc, " sfebdocno = '", g_sfebdocno, "' "


   IF NOT cl_null(ls_wc) THEN
      LET ls_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_wc = ls_wc
   ELSE
      LET g_wc = " 1=1"
   END IF

END FUNCTION

PRIVATE FUNCTION asrt340_01_delete_b(ps_table,ps_keys_bak,ps_page)
   {<Local define>}
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   {</Local define>}
   #add-point:delete_b段define
   {<point name="delete_b.define"/>}
   #end add-point

   #判斷是否是同一群組的table
   LET ls_group = "sfeb_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:delete_b段刪除前
      {<point name="delete_b.before_delete" mark="Y"/>}
      #end add-point
      DELETE FROM sfeb_t
       WHERE sfebent = g_enterprise AND
         sfebdocno = ps_keys_bak[1] AND sfebseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中
      {<point name="delete_b.m_delete"/>}
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = ""
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
      #add-point:delete_b段刪除後
      {<point name="delete_b.after_delete"/>}
      #end add-point
   END IF



   LET ls_group = "sfec_t,"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:delete_b段刪除前
      {<point name="delete_b.before_delete2" mark="Y"/>}
      #end add-point
      DELETE FROM sfec_t
       WHERE sfecent = g_enterprise AND
         sfecdocno = ps_keys_bak[1] AND sfecseq = ps_keys_bak[2] AND sfecseq1 = ps_keys_bak[3]
      #add-point:delete_b段刪除中
      {<point name="delete_b.m_delete2"/>}
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfec_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
      #add-point:delete_b段刪除後
      {<point name="delete_b.after_delete2"/>}
      #end add-point
      RETURN
   END IF



   #單頭刪除, 連帶刪除單身
   LET ls_group = "sfeb_t,"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:delete_b段刪除前
      {<point name="delete_b.before_body_delete2" mark="Y"/>}
      #end add-point
      DELETE FROM sfec_t
       WHERE sfecent = g_enterprise AND
         sfecdocno = ps_keys_bak[1] AND sfecseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中
      {<point name="delete_b.m_body_delete2"/>}
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfec_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
      #add-point:delete_b段刪除後
      {<point name="delete_b.after_body_delete2"/>}
      #end add-point
      RETURN
   END IF



END FUNCTION

PRIVATE FUNCTION asrt340_01_insert_b(ps_table,ps_keys,ps_page)
   {<Local define>}
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   {</Local define>}
   #add-point:insert_b段define
   {<point name="insert_b.define"/>}
   #end add-point

   #判斷是否是同一群組的table
   LET ls_group = "sfeb_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:insert_b段新增前
      {<point name="insert_b.before_insert" mark="Y"/>}
      #end add-point
      INSERT INTO sfeb_t
                  (sfebent,
                   sfebdocno,sfebseq
                   ,sfeb023,sfeb024,sfeb025,sfeb002,sfeb003,sfeb004,sfeb005,sfeb006,sfeb007,sfeb008,sfeb027,sfeb009,sfeb010,sfeb011,sfeb012,sfeb013,sfeb014,sfeb015,sfeb016,sfeb017,sfeb018,sfeb019,sfeb020,sfeb021,sfeb022,sfebsite)
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sfeb_d[g_detail_idx].sfeb023,g_sfeb_d[g_detail_idx].sfeb024,g_sfeb_d[g_detail_idx].sfeb025,
                   g_sfeb_d[g_detail_idx].sfeb002,g_sfeb_d[g_detail_idx].sfeb003,
                       g_sfeb_d[g_detail_idx].sfeb004,g_sfeb_d[g_detail_idx].sfeb005,g_sfeb_d[g_detail_idx].sfeb006,
                       g_sfeb_d[g_detail_idx].sfeb007,g_sfeb_d[g_detail_idx].sfeb008,
                       g_sfeb_d[g_detail_idx].sfeb027,g_sfeb_d[g_detail_idx].sfeb009,
                       g_sfeb_d[g_detail_idx].sfeb010,g_sfeb_d[g_detail_idx].sfeb011,g_sfeb_d[g_detail_idx].sfeb012,
                       g_sfeb_d[g_detail_idx].sfeb013,g_sfeb_d[g_detail_idx].sfeb014,g_sfeb_d[g_detail_idx].sfeb015,
                       g_sfeb_d[g_detail_idx].sfeb016,g_sfeb_d[g_detail_idx].sfeb017,g_sfeb_d[g_detail_idx].sfeb018,
                       g_sfeb_d[g_detail_idx].sfeb019,g_sfeb_d[g_detail_idx].sfeb020,g_sfeb_d[g_detail_idx].sfeb021,
                       g_sfeb_d[g_detail_idx].sfeb022,g_sfeb_d[g_detail_idx].sfebsite)
      #add-point:insert_b段新增中
      {<point name="insert_b.m_insert"/>}
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfeb_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
      #add-point:insert_b段新增後
      {<point name="insert_b.after_insert"/>}
      #end add-point
   END IF



   LET ls_group = "sfec_t,"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:insert_b段新增前
      {<point name="insert_b.before_insert2" mark="Y"/>}
      #end add-point
      INSERT INTO sfec_t
                  (sfecent,
                   sfecdocno,sfecseq,sfecseq1
                   ,sfec001,sfec002,sfec003,sfec004,sfec005,sfec006,sfec007,sfec008,sfec009,sfec010,sfec011,sfec012,sfec013,sfec014,sfec015,sfec016,sfec018,sfec019,sfec020,sfec017,sfecsite)
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_sfec_d[g_detail_idx2].sfec001,g_sfec_d[g_detail_idx2].sfec002,g_sfec_d[g_detail_idx2].sfec003,
                       g_sfec_d[g_detail_idx2].sfec004,g_sfec_d[g_detail_idx2].sfec005,g_sfec_d[g_detail_idx2].sfec006,
                       g_sfec_d[g_detail_idx2].sfec007,g_sfec_d[g_detail_idx2].sfec008,g_sfec_d[g_detail_idx2].sfec009,
                       g_sfec_d[g_detail_idx2].sfec010,g_sfec_d[g_detail_idx2].sfec011,g_sfec_d[g_detail_idx2].sfec012,
                       g_sfec_d[g_detail_idx2].sfec013,g_sfec_d[g_detail_idx2].sfec014,g_sfec_d[g_detail_idx2].sfec015,
                       g_sfec_d[g_detail_idx2].sfec016,g_sfec_d[g_detail_idx2].sfec018,g_sfec_d[g_detail_idx2].sfec019,
                       g_sfec_d[g_detail_idx2].sfec020,g_sfec_d[g_detail_idx2].sfec017,g_sfec_d[g_detail_idx2].sfecsite)

      #add-point:insert_b段新增中
      {<point name="insert_b.m_insert2"/>}
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfec_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
      #add-point:insert_b段新增後
      {<point name="insert_b.after_insert2"/>}
      #end add-point
   END IF



END FUNCTION

PRIVATE FUNCTION asrt340_01_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   {<Local define>}
   DEFINE ps_table         STRING
   DEFINE ps_page          STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num5
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   {</Local define>}
   #add-point:update_b段define
   {<point name="update_b.define"/>}
   #end add-point

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
   LET ls_group = "sfeb_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN

      #add-point:update_b段修改前
      {<point name="update_b.before_update" mark="Y"/>}
      #end add-point

      UPDATE sfeb_t
         SET (sfebdocno,sfebseq
              ,sfeb023,sfeb024,sfeb025,sfeb002,sfeb003,sfeb004,sfeb005,sfeb006,sfeb007,sfeb008,sfeb027,sfeb009,sfeb010,sfeb011,sfeb012,sfeb013,sfeb014,sfeb015,sfeb016,sfeb017,sfeb018,sfeb019,sfeb020,sfeb021,sfeb022,sfebsite)
              =
             (ps_keys[1],ps_keys[2]
              ,g_sfeb_d[g_detail_idx].sfeb023,g_sfeb_d[g_detail_idx].sfeb024,g_sfeb_d[g_detail_idx].sfeb025,
              g_sfeb_d[g_detail_idx].sfeb002,g_sfeb_d[g_detail_idx].sfeb003,
                  g_sfeb_d[g_detail_idx].sfeb004,g_sfeb_d[g_detail_idx].sfeb005,g_sfeb_d[g_detail_idx].sfeb006,
                  g_sfeb_d[g_detail_idx].sfeb007,g_sfeb_d[g_detail_idx].sfeb008,
                  g_sfeb_d[g_detail_idx].sfeb027,g_sfeb_d[g_detail_idx].sfeb009,
                  g_sfeb_d[g_detail_idx].sfeb010,g_sfeb_d[g_detail_idx].sfeb011,g_sfeb_d[g_detail_idx].sfeb012,
                  g_sfeb_d[g_detail_idx].sfeb013,g_sfeb_d[g_detail_idx].sfeb014,g_sfeb_d[g_detail_idx].sfeb015,
                  g_sfeb_d[g_detail_idx].sfeb016,g_sfeb_d[g_detail_idx].sfeb017,g_sfeb_d[g_detail_idx].sfeb018,
                  g_sfeb_d[g_detail_idx].sfeb019,g_sfeb_d[g_detail_idx].sfeb020,g_sfeb_d[g_detail_idx].sfeb021,
                  g_sfeb_d[g_detail_idx].sfeb022,g_sfeb_d[g_detail_idx].sfebsite)
         WHERE sfebent = g_enterprise AND sfebdocno = ps_keys_bak[1] AND sfebseq = ps_keys_bak[2] #160905-00007#15 by 08172 add ent

      #add-point:update_b段修改中
      {<point name="update_b.m_update"/>}
      #end add-point

      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "sfeb_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            CALL s_transaction_end('N','0')
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "sfeb_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            CALL s_transaction_end('N','0')
         OTHERWISE

      END CASE

      #add-point:update_b段修改後
      {<point name="update_b.after_update"/>}
      #end add-point

      RETURN
   END IF



   LET ls_group = "sfec_t,"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN

      #add-point:update_b段修改前
      {<point name="update_b.before_update2" mark="Y"/>}
      #end add-point

      UPDATE sfec_t
         SET (sfecdocno,sfecseq,sfecseq1
              ,sfec001,sfec002,sfec003,sfec004,sfec005,sfec006,sfec007,sfec008,sfec009,sfec010,sfec011,sfec012,sfec013,sfec014,sfec015,sfec016,sfec018,sfec019,sfec020,sfec017,sfecsite)
              =
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_sfec_d[g_detail_idx2].sfec001,g_sfec_d[g_detail_idx2].sfec002,g_sfec_d[g_detail_idx2].sfec003,
                  g_sfec_d[g_detail_idx2].sfec004,g_sfec_d[g_detail_idx2].sfec005,g_sfec_d[g_detail_idx2].sfec006,
                  g_sfec_d[g_detail_idx2].sfec007,g_sfec_d[g_detail_idx2].sfec008,g_sfec_d[g_detail_idx2].sfec009,
                  g_sfec_d[g_detail_idx2].sfec010,g_sfec_d[g_detail_idx2].sfec011,g_sfec_d[g_detail_idx2].sfec012,
                  g_sfec_d[g_detail_idx2].sfec013,g_sfec_d[g_detail_idx2].sfec014,g_sfec_d[g_detail_idx2].sfec015,
                  g_sfec_d[g_detail_idx2].sfec016,g_sfec_d[g_detail_idx2].sfec018,g_sfec_d[g_detail_idx2].sfec019,
                  g_sfec_d[g_detail_idx2].sfec020,g_sfec_d[g_detail_idx2].sfec017,g_sfec_d[g_detail_idx2].sfecsite)

         WHERE sfecent = g_enterprise AND sfecdocno = ps_keys_bak[1] AND sfecseq = ps_keys_bak[2] AND sfecseq1 = ps_keys_bak[3]
         #160905-00007#15 by 08172
      #add-point:update_b段修改中
      {<point name="update_b.m_update2"/>}
      #end add-point

      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "sfec_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            CALL s_transaction_end('N','0')
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "sfec_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            CALL s_transaction_end('N','0')
         OTHERWISE

      END CASE

      #add-point:update_b段修改後
      {<point name="update_b.after_update2"/>}
      #end add-point

      RETURN
   END IF



END FUNCTION

PRIVATE FUNCTION asrt340_01_key_update_b()
   {<Local define>}
   DEFINE li_idx           LIKE type_t.num5
   DEFINE lb_chk           BOOLEAN
   {</Local define>}
   #add-point:update_b段define
   {<point name="key_update_b.define"/>}
   #end add-point

   #判斷key是否有改變
   LET lb_chk = TRUE

   IF g_master.sfebdocno <> g_master_t.sfebdocno THEN
      LET lb_chk = FALSE
   END IF
   IF g_master.sfebseq <> g_master_t.sfebseq THEN
      LET lb_chk = FALSE
   END IF


   #不需要做處理
   IF lb_chk THEN
      RETURN
   END IF

   #add-point:update_b段修改前
   {<point name="key_update_b.before_update2" mark="Y"/>}
   #end add-point

   UPDATE sfec_t
      SET (sfecdocno,sfecseq)
           =
          (g_master.sfebdocno,g_master.sfebseq)
      WHERE
           sfecdocno = g_master_t.sfebdocno
           AND sfecseq = g_master_t.sfebseq
           AND sfecent = g_enterprise #160905-00007#15 by 08172



   #add-point:update_b段修改中
   {<point name="key_update_b.m_update2"/>}
   #end add-point

   CASE
      WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = "std-00009"
         LET g_errparam.extend = "sfec_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         CALL s_transaction_end('N','0')
      WHEN SQLCA.sqlcode #其他錯誤
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfec_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         CALL s_transaction_end('N','0')
      OTHERWISE
         #若有多語言table資料一同更新

   END CASE

   #add-point:update_b段修改後
   {<point name="key_update_b.after_update2"/>}
   #end add-point




END FUNCTION

PRIVATE FUNCTION asrt340_01_lock_b(ps_table)
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:lock_b段define
   {<point name="lock_b.define"/>}
   #end add-point

   #先刷新資料
   #CALL asrt340_01_b_fill(g_wc)

   #鎖定整組table
   #LET ls_group = ""
   #僅鎖定自身table
   LET ls_group = "sfeb_t"

   IF ls_group.getIndexOf(ps_table,1) THEN

      OPEN asrt340_01_bcl USING g_enterprise,
                                       g_sfeb_d[g_detail_idx].sfebdocno,g_sfeb_d[g_detail_idx].sfebseq


      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "asrt340_01_bcl"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF

   END IF



   #鎖定整組table
   #LET ls_group = "sfec_t,"
   #僅鎖定自身table
   LET ls_group = "sfec_t"
   IF ls_group.getIndexOf(ps_table,1) THEN

      OPEN asrt340_01_bcl2 USING g_enterprise,
                                             g_master.sfebdocno,g_master.sfebseq,
                                             g_sfec_d[g_detail_idx2].sfecseq1

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "asrt340_01_bcl2"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF



   RETURN TRUE

END FUNCTION

PRIVATE FUNCTION asrt340_01_unlock_b(ps_table)
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:unlock_b段define
   {<point name="unlock_b.define"/>}
   #end add-point

   LET ls_group = ""

   IF ls_group.getIndexOf(ps_table,1) THEN
      CLOSE asrt340_01_bcl
   END IF



   LET ls_group = "sfec_t,"

   IF ls_group.getIndexOf(ps_table,1) THEN
      CLOSE asrt340_01_bcl2
   END IF



END FUNCTION

PRIVATE FUNCTION asrt340_01_modify_detail_chk(ps_record)
   {<Local define>}
   DEFINE ps_record STRING
   DEFINE ls_return STRING
   {</Local define>}
   #add-point:modify_detail_chk段define
   {<point name="modify_detail_chk.define"/>}
   #end add-point

   #add-point:modify_detail_chk段開始前
   {<point name="modify_detail_chk.before"/>}
   #end add-point

   CASE ps_record
      WHEN "s_detail1"
         LET ls_return = "sfebdocno"
      WHEN "s_detail2"
         LET ls_return = "sfecseq1"


      #add-point:modify_detail_chk段自訂page控制
      {<point name="modify_detail_chk.page_control"/>}
      #end add-point
   END CASE

   #add-point:modify_detail_chk段結束前
   {<point name="modify_detail_chk.after"/>}
   #end add-point

   RETURN ls_return

END FUNCTION
################################################################################
# Descriptions...: 预设qc参考值
# Memo...........:
# Usage..........: CALL asrt340_01_qc_reference()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-01-13 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt340_01_qc_reference()
   #   DEFINE  l_qcbc          RECORD LIKE qcbc_t.*    #161124-00048#21 mark
   #161124-00048#21 add(s)
   DEFINE l_qcbc RECORD  #品質檢驗判定結果檔
       qcbcent LIKE qcbc_t.qcbcent, #企业编号
       qcbcsite LIKE qcbc_t.qcbcsite, #营运据点
       qcbcdocno LIKE qcbc_t.qcbcdocno, #单号
       qcbcseq LIKE qcbc_t.qcbcseq, #行序
       qcbc001 LIKE qcbc_t.qcbc001, #类型
       qcbc002 LIKE qcbc_t.qcbc002, #判定结果编号
       qcbc003 LIKE qcbc_t.qcbc003, #料件编号
       qcbc004 LIKE qcbc_t.qcbc004, #产品特征
       qcbc005 LIKE qcbc_t.qcbc005, #库位
       qcbc006 LIKE qcbc_t.qcbc006, #储位
       qcbc007 LIKE qcbc_t.qcbc007, #批号
       qcbc008 LIKE qcbc_t.qcbc008, #单位
       qcbc009 LIKE qcbc_t.qcbc009, #判定数量
       qcbc010 LIKE qcbc_t.qcbc010, #已入库数
       qcbc011 LIKE qcbc_t.qcbc011, #库存备注
       qcbc012 LIKE qcbc_t.qcbc012, #判定区分
       qcbc013 LIKE qcbc_t.qcbc013  #处理方式
END RECORD
   #161124-00048#21 add(e)

   IF cl_null(g_sfec_d[l_ac].sfec002) OR cl_null(g_sfec_d[l_ac].sfec003) THEN
      RETURN
   END IF
   
#   SELECT * INTO l_qcbc.* FROM qcbc_t #161124-00048#21 mark
    #161124-00048#21 add(s)
    SELECT qcbcent,qcbcsite,qcbcdocno,qcbcseq,qcbc001,qcbc002,qcbc003,qcbc004,qcbc005,
           qcbc006,qcbc007,qcbc008,qcbc009,qcbc010,qcbc011,qcbc012,qcbc013 
      INTO l_qcbc.* FROM qcbc_t
    #161124-00048#21 add(e)
    WHERE qcbcent   = g_enterprise
      AND qcbcsite  = g_master.sfebsite
      AND qcbcdocno = g_sfec_d[l_ac].sfec002
      AND qcbcseq   = g_sfec_d[l_ac].sfec003
      
   #判定结果   
   LET g_sfec_d[l_ac].sfec003_desc1 = l_qcbc.qcbc002
   #判定结果说明
   LET g_sfec_d[l_ac].sfec003_desc2 = s_desc_get_qc_desc(g_master.sfebsite,g_sfec_d[l_ac].sfec003_desc1)
   #入库类型
   IF l_qcbc.qcbc001 = '0' THEN   #一般
      LET g_sfec_d[l_ac].sfec004 = g_master.sfeb003
   ELSE                           #联产品
      LET g_sfec_d[l_ac].sfec004 = '2'
   END IF
   #料件
   LET g_sfec_d[l_ac].sfec005 = l_qcbc.qcbc003
   #品名/规格
   CALL s_desc_get_item_desc(g_sfec_d[l_ac].sfec005)
        RETURNING g_sfec_d[l_ac].sfec005_desc1,g_sfec_d[l_ac].sfec005_desc2
   #特征
   LET g_sfec_d[l_ac].sfec006 = l_qcbc.qcbc004
   #数量sfec009
   LET g_sfec_d[l_ac].sfec009 = asrt340_01_get_sfec009()

   #参考数量sfec011
   
   #仓库
   LET g_sfec_d[l_ac].sfec012 = l_qcbc.qcbc005
   #储位
   LET g_sfec_d[l_ac].sfec013 = l_qcbc.qcbc006
   
   #批号
   LET g_sfec_d[l_ac].sfec014 = g_master.sfeb015
   #库存管理特征
   LET g_sfec_d[l_ac].sfec015 = g_master.sfeb016
   
   #库存有效日期
   LET g_sfec_d[l_ac].sfec016 = g_master.sfeb021
   #备注
   LET g_sfec_d[l_ac].sfec017 = g_master.sfeb022


END FUNCTION
################################################################################
# Descriptions...: 设置sfec002
# Memo...........:
# Usage..........: CALL asrt340_01_set_sfec002()
#                  RETURNING 回传参数
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-01-13 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt340_01_set_sfec002()
   DEFINE l_cnt         LIKE type_t.num5
   
   LET g_sfec_d[l_ac].sfec002 = NULL

   IF g_master.sfeb002 = 'N' THEN
      RETURN 
   END IF

   SELECT COUNT(*) INTO l_cnt
     FROM qcba_t
    WHERE qcbaent  = g_enterprise
      AND qcbasite = g_master.sfebsite
      AND qcba001  = g_sfebdocno                  #QC来源单号
      AND qcba002  = g_master.sfebseq        #QC来源项次
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt = 1 THEN
      SELECT qcbadocno INTO g_sfec_d[l_ac].sfec002
        FROM qcba_t
       WHERE qcbaent  = g_enterprise
         AND qcbasite = g_master.sfebsite
         AND qcba001  = g_sfebdocno                #QC来源单号
         AND qcba002  = g_master.sfebseq        #QC来源项次                  
      DISPLAY BY NAME g_sfec_d[l_ac].sfec002
   END IF

END FUNCTION
################################################################################
# Descriptions...: 设置sfec003
# Memo...........:
# Usage..........: CALL asrt340_01_set_sfec003()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-01-13 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt340_01_set_sfec003()
   DEFINE l_cnt         LIKE type_t.num5

   LET g_sfec_d[l_ac].sfec003 = NULL
   IF g_master.sfeb002 = 'N' THEN
      RETURN 
   END IF
      
   SELECT COUNT(*) INTO l_cnt
     FROM qcbc_t
    WHERE qcbcent  = g_enterprise
      AND qcbcsite = g_master.sfebsite
      AND qcbc001  = g_sfec_d[l_ac].sfec001       #FQC单
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt = 1 THEN
      SELECT qcbcseq INTO g_sfec_d[l_ac].sfec003
        FROM qcbc_t
       WHERE qcbcent  = g_enterprise
         AND qcbcsite = g_master.sfebsite
         AND qcbc001  = g_sfec_d[l_ac].sfec001       #FQC单                
      DISPLAY BY NAME g_sfec_d[l_ac].sfec003
   END IF

END FUNCTION
################################################################################
# Descriptions...: 取得sfec009
# Memo...........:
# Usage..........: CALL asrt340_01_get_sfec009()
#                  RETURNING r_available
# Input parameter: NULL
# Return code....: r_available 要入库数量
# Date & Author..: 2014-01-13 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt340_01_get_sfec009()
   DEFINE l_cnt         LIKE type_t.num5
   DEFINE l_tot_qty     LIKE sfec_t.sfec009
   DEFINE l_used        LIKE sfec_t.sfec009
   DEFINE r_available   LIKE sfec_t.sfec009

   IF g_master.sfeb002 = 'N' THEN
      LET l_tot_qty = g_master.sfeb008
      SELECT SUM(sfec009) INTO l_used FROM sfec_t
       WHERE sfecent   = g_enterprise
         AND sfecdocno = g_sfebdocno            #
         AND sfecseq   = g_master.sfebseq
         AND sfecseq1  <> g_sfec_d[l_ac].sfecseq1      
   ELSE
      SELECT qcbc009 INTO l_tot_qty FROM qcbc_t
       WHERE qcbcent   = g_enterprise
         AND qcbcsite  = g_master.sfebsite
         AND qcbcdocno = g_sfec_d[l_ac].sfec002
         AND qcbcseq   = g_sfec_d[l_ac].sfec003

      SELECT SUM(sfec009) INTO l_used FROM sfec_t
       WHERE sfecent   = g_enterprise
         AND sfecdocno = g_sfebdocno            
         AND sfecseq   = g_master.sfebseq
         AND sfec002   = g_sfec_d[l_ac].sfec002
         AND sfec003   = g_sfec_d[l_ac].sfec003
         AND sfecseq1  <> g_sfec_d[l_ac].sfecseq1
   END IF
   IF cl_null(l_tot_qty) THEN LET l_tot_qty = 0 END IF
   IF cl_null(l_used) THEN LET l_used = 0 END IF
   
   #可入库数量
   LET r_available = l_tot_qty - l_used
   RETURN r_available

END FUNCTION
################################################################################
# Descriptions...: 检查sfec009
# Memo...........:
# Usage..........: CALL asrt340_01_chk_sfec009()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success 检查通过否
# Date & Author..: 2014-01-13 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt340_01_chk_sfec009()
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_qty         LIKE sfec_t.sfec009
                   
   LET r_success = FALSE
   IF g_sfec_d[l_ac].sfec009 <= 0 THEN
      RETURN r_success
   END IF
   LET l_qty = asrt340_01_get_sfec009()
   IF g_sfec_d[l_ac].sfec009 > l_qty THEN
      RETURN r_success 
   END IF
   LET r_success = TRUE
   RETURN r_success  

END FUNCTION
################################################################################
# Descriptions...: 检查sfec011
# Memo...........:
# Usage..........: CALL asrt340_01_chk_sfec011()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success 检查通过否
# Date & Author..: 2014-01-13 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt340_01_chk_sfec011()
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_qty         LIKE sfec_t.sfec011
                   
   LET r_success = FALSE
   IF g_sfec_d[l_ac].sfec011 <= 0 THEN
      RETURN r_success
   END IF
   LET l_qty = asrt340_01_get_sfec011()
   IF g_sfec_d[l_ac].sfec011 > l_qty THEN
      RETURN r_success 
   END IF
   LET r_success = TRUE
   RETURN r_success 

END FUNCTION
################################################################################
# Descriptions...: 检查仓库资讯
# Memo...........:
# Usage..........: CALL asrt340_01_chk_warehouse()
#                  RETURNING r_success
# Input parameter: NULL
# Return code....: r_success 检查通过否标识符
# Date & Author..: 2014-01-13 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt340_01_chk_warehouse(p_type)
   DEFINE p_type         LIKE type_t.chr1   #161006-00018#15
   DEFINE r_success      LIKE type_t.num5
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_flag         LIKE type_t.num5
   DEFINE l_doc_type     LIKE ooba_t.ooba002
   DEFINE l_qcbc012      LIKE qcbc_t.qcbc012
   DEFINE l_ooef025      LIKE ooef_t.ooef025
   DEFINE l_qcao005      LIKE qcao_t.qcao005
   DEFINE l_qcao006      LIKE qcao_t.qcao006
   DEFINE l_qcao007      LIKE qcao_t.qcao007
   DEFINE l_inaa008      LIKE inaa_t.inaa008
   DEFINE l_inaa009      LIKE inaa_t.inaa009
   DEFINE l_inaa010      LIKE inaa_t.inaa010   

   LET r_success = FALSE
   
   IF p_type = '1' THEN #161006-00018#15
      #1.检查库存基础档
      IF NOT cl_null(g_sfec_d[l_ac].sfec012) THEN
         INITIALIZE g_chkparam.* TO NULL
         LET g_chkparam.arg1 = g_sfec_d[l_ac].sfec012
         #160318-00025#22  by 07900 --add-str
         LET g_errshow = TRUE #是否開窗                   
         LET g_chkparam.err_str[1] ="aim-00065:sub-01302|aini001|",cl_get_progname("aini001",g_lang,"2"),"|:EXEPROGaini001"
         #160318-00025#22  by 07900 --add-end 
         IF NOT cl_chk_exist("v_inaa001_2") THEN
            RETURN r_success
         END IF
         
         #.若有QC判定項次時，依判定結果的設定判斷可入的倉庫為成本倉、可用倉、MRP可用倉
         IF g_master.sfeb002 = 'Y' THEN
            #1.取出参照表号
            SELECT ooef025 INTO l_ooef025 FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_master.sfebsite
            #2.取判定结果 g_sfec_d[l_ac].qcbc002
            #3.取aqci020中的仓库属性设置
            SELECT qcao005,qcao006,qcao007 INTO l_qcao005,l_qcao006,l_qcao007
              FROM qcao_t
             WHERE qcaoent = g_enterprise
               AND qcao001 = l_ooef025
               AND qcao002 = g_sfec_d[l_ac].sfec003_desc1
            IF cl_null(l_qcao005) THEN LET l_qcao005 = 'Y' END IF
            IF cl_null(l_qcao006) THEN LET l_qcao006 = 'Y' END IF
            IF cl_null(l_qcao007) THEN LET l_qcao007 = 'Y' END IF
            #4.取aini001中的仓库设置
            SELECT inaa008,inaa009,inaa010 INTO l_inaa008,l_inaa009,l_inaa010
              FROM inaa_t
             WHERE inaaent  = g_enterprise
               AND inaasite = g_master.sfebsite
               AND inaa001  = g_sfec_d[l_ac].sfec012
            IF l_inaa008 <> l_qcao006 OR l_inaa009 <> l_qcao007 OR l_inaa010 <> l_qcao005 THEN
               #仓库限制 成本仓否=%1 可用仓否=%2 MRP可用仓否=%3,请检查所选仓库是否匹配此3项设置
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00121'
               LET g_errparam.extend = g_sfec_d[l_ac].sfec012
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = l_qcao005 
               LET g_errparam.replace[2] =  l_qcao006 
               LET g_errparam.replace[3] =  l_qcao007
               CALL cl_err()
     
               RETURN r_success
            END IF
         END IF
      END IF
   END IF #161006-00018#15
   
   IF p_type ='2' THEN 
      #2.检查储位
      #IF g_sfec_d[l_ac].sfec013 IS NOT NULL THEN   #161006-00018#15 mark
      IF g_sfec_d[l_ac].sfec013 IS NOT NULL AND NOT cl_null(g_sfec_d[l_ac].sfec012) THEN   #161006-00018#15
         INITIALIZE g_chkparam.* TO NULL
         LET g_chkparam.arg1 = g_site
         LET g_chkparam.arg2 = g_sfec_d[l_ac].sfec012
         LET g_chkparam.arg3 = g_sfec_d[l_ac].sfec013
         #160318-00025#22  by 07900 --add-str
         LET g_errshow = TRUE #是否開窗                   
         LET g_chkparam.err_str[1] ="aim-00063:sub-01302|aini002|",cl_get_progname("aini002",g_lang,"2"),"|:EXEPROGaini002"
         #160318-00025#22  by 07900 --add-end
         IF NOT cl_chk_exist("v_inab002") THEN
            RETURN r_success
         END IF
      END IF
   END IF  #161006-00018#15
   #3.检查是否通过 单别+仓库+储位 控制组的检查
   IF NOT cl_null(g_sfec_d[l_ac].sfec012) AND g_sfec_d[l_ac].sfec013 IS NOT NULL THEN
      CALL s_aooi200_get_slip(g_sfebdocno)
           RETURNING l_success,l_doc_type
      CALL s_control_chk_doc('7',l_doc_type,g_sfec_d[l_ac].sfec012,g_sfec_d[l_ac].sfec013,'','','')
          RETURNING l_success,l_flag
      IF NOT l_success OR NOT l_flag THEN
         #控制组检查错误,请检查单别设定的相关内容
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00122'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
   END IF

   LET r_success = TRUE
   RETURN r_success
   

END FUNCTION
################################################################################
# Descriptions...: 参考数量 sfec011的默认值设定
# Memo...........:
# Usage..........: CALL asrt340_01_set_sfec011()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-03-14 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt340_01_set_sfec011()
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_rate         LIKE inaj_t.inaj014
   
   #若没有参考单位时,参考数量DEFAULT NULL
   IF cl_null(g_sfec_d[l_ac].sfec010) THEN
      LET g_sfec_d[l_ac].sfec011 = NULL
      RETURN
   END IF
   
   LET g_sfec_d[l_ac].sfec011 = g_sfec_d[l_ac].sfec009
   
   IF NOT cl_null(g_sfec_d[l_ac].sfec008) AND NOT cl_null(g_sfec_d[l_ac].sfec010) THEN
#      CALL s_aimi190_get_convert(g_sfec_d[l_ac].sfec005,g_sfec_d[l_ac].sfec008,g_sfec_d[l_ac].sfec010)
#           RETURNING l_success,l_rate
#      IF NOT l_success THEN
#         LET l_rate = 1
#      END IF   
      CALL s_aooi250_convert_qty(g_sfec_d[l_ac].sfec005,g_sfec_d[l_ac].sfec008,g_sfec_d[l_ac].sfec010,g_sfec_d[l_ac].sfec009)
           RETURNING l_success,g_sfec_d[l_ac].sfec011
      IF NOT l_success THEN
         LET g_sfec_d[l_ac].sfec011 = g_sfec_d[l_ac].sfec009
      END IF   
   END IF
   
#   LET g_sfec_d[l_ac].sfec011 = g_sfec_d[l_ac].sfec009 * l_rate
END FUNCTION
################################################################################
# Descriptions...: 取sfec011
# Memo...........:
# Usage..........: CALL asrt340_01_get_sfec011()
#                  RETURNING r_available
# Input parameter: NULL
# Return code....: r_available 可入库的参考数量
# Date & Author..: 2014-01-13 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt340_01_get_sfec011()
   DEFINE l_cnt         LIKE type_t.num5
   DEFINE l_tot_qty     LIKE sfec_t.sfec011
   DEFINE l_used        LIKE sfec_t.sfec011
   DEFINE r_available   LIKE sfec_t.sfec011

   IF g_master.sfeb002 = 'N' THEN
      LET l_tot_qty = g_master.sfeb011
      SELECT SUM(sfec011) INTO l_used FROM sfec_t
       WHERE sfecent   = g_enterprise
         AND sfecdocno = g_sfebdocno            #
         AND sfecseq   = g_master.sfebseq
         AND sfecseq1  <> g_sfec_d[l_ac].sfecseq1      
   ELSE
      #此次取参考数量,等liyu通知字段是哪个
      SELECT qcbc009 INTO l_tot_qty FROM qcbc_t
       WHERE qcbcent   = g_enterprise
         AND qcbcsite  = g_master.sfebsite
         AND qcbcdocno = g_sfec_d[l_ac].sfec002
         AND qcbcseq   = g_sfec_d[l_ac].sfec003

      SELECT SUM(sfec011) INTO l_used FROM sfec_t
       WHERE sfecent   = g_enterprise
         AND sfecdocno = g_sfebdocno            
         AND sfecseq   = g_master.sfebseq
         AND sfec002   = g_sfec_d[l_ac].sfec002
         AND sfec003   = g_sfec_d[l_ac].sfec003
         AND sfecseq1  <> g_sfec_d[l_ac].sfecseq1
   END IF
   IF cl_null(l_tot_qty) THEN LET l_tot_qty = 0 END IF
   IF cl_null(l_used) THEN LET l_used = 0 END IF
   
   #可入库数量
   LET r_available = l_tot_qty - l_used
   RETURN r_available

END FUNCTION

 
{</section>}
 
