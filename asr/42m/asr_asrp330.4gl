#該程式未解開Section, 採用最新樣板產出!
{<section id="asrp330.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0006(2015-06-11 16:49:33), PR版次:0006(2017-02-13 10:17:54)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000119
#+ Filename...: asrp330
#+ Description: 重覆性生產即時報工作業
#+ Creator....: 05795(2015-06-09 15:05:39)
#+ Modifier...: 05795 -SD/PR- 08734
 
{</section>}
 
{<section id="asrp330.global" >}
#應用 i00 樣板自動產生(Version:10)
#add-point:填寫註解說明 name="global.memo"
#+ Modifier...:   No.160318-00025#34  2016/04/14 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#161124-00048#10 2016/12/13 By xujing     整批调整系统RECORD LIKE xxxx_t.* 星号写法
#161228-00028#2  2017/01/12 By 02295      报工类型改成11~15
#170207-00018#5  2017/02/13 By 08734      ROWNUM整批调整
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
{<Module define>}
#單頭 type 宣告
 type type_g_sffb_m        RECORD
   sffb025 LIKE sffb_t.sffb025,
   sffb025_desc LIKE type_t.chr80,
   sffb009 LIKE sffb_t.sffb009,
   sffb009_desc LIKE type_t.chr80,
   sffb007 LIKE sffb_t.sffb007, 
   sffb007_desc LIKE type_t.chr80,
   sffbdocno LIKE sffb_t.sffbdocno, 
   sffbdocno_desc LIKE type_t.chr80,
   sffb004 LIKE sffb_t.sffb004, 
   sffb004_desc LIKE type_t.chr80,
   sffb010 LIKE sffb_t.sffb010, 
   sffb010_desc LIKE type_t.chr80,
   sffb002 LIKE sffb_t.sffb002, 
   sffb002_desc LIKE type_t.chr80, 
   sffb003 LIKE sffb_t.sffb003, 
   sffb003_desc LIKE type_t.chr80, 
   sffb024 LIKE sffb_t.sffb024, 
   sffb024_desc LIKE type_t.chr80,
   sffb011 LIKE sffb_t.sffb011
       END RECORD

#右侧page报工咨讯 type 宣告
 type type_g_sffb_m1        RECORD
   sffb001 LIKE sffb_t.sffb001,
   sffb026 LIKE sffb_t.sffb026,
   sffb026_desc LIKE imaal_t.imaal003,
   sffb026_desc_1 LIKE imaal_t.imaal004,
   sffb027 LIKE sffb_t.sffb027,
   sffb028 LIKE sffb_t.sffb028,
   sffb007 LIKE sffb_t.sffb007,
   sffb008 LIKE sffb_t.sffb008,    
   sffb007_desc LIKE type_t.chr80,
   qty     LIKE srac_t.srac032,
   sffb016 LIKE sffb_t.sffb016,
   sffb012 LIKE sffb_t.sffb012, 
   sffb013 LIKE sffb_t.sffb013,
   sffb014 LIKE type_t.chr20, 
   sffb015 LIKE type_t.chr20,
   sffb017 LIKE type_t.chr20, 
   sffb018 LIKE type_t.chr20, 
   sffb019 LIKE type_t.chr20, 
   sffb020 LIKE type_t.chr20,
   sffb021 LIKE sffb_t.sffb021,
   sffb021_desc LIKE type_t.chr20,
   sffb022 LIKE sffb_t.sffb022
       END RECORD
 
#右侧不良原因页签
 TYPE type_g_sffd_d        RECORD
   sffdseq1 LIKE sffd_t.sffdseq1, 
   sffd001 LIKE sffd_t.sffd001, 
   sffd001_desc LIKE type_t.chr500, 
   sffd002 LIKE sffd_t.sffd002, 
   sffd003 LIKE sffd_t.sffd003
       END RECORD

#右侧Check In/Check Out页签
 TYPE type_g_sffc_d RECORD
   sffc001 LIKE sffc_t.sffc001, 
   sffc001_desc LIKE type_t.chr500, 
   sffc002 LIKE sffc_t.sffc002, 
   sffc003 LIKE sffc_t.sffc003, 
   sffc004 LIKE sffc_t.sffc004, 
   sffc005 LIKE sffc_t.sffc005, 
   sffc006 LIKE sffc_t.sffc006
       END RECORD

#單身 type 宣告
 TYPE type_g_srac_d RECORD
   chk1                      LIKE type_t.chr500,
   srac004_1                 LIKE srac_t.srac004,
   srac030                   LIKE srac_t.srac030,
   srac004_1_desc            LIKE type_t.chr500,
   srac004_1_desc_1          LIKE type_t.chr500,
   srac005                   LIKE srac_t.srac005,
   srac006                   LIKE srac_t.srac006,
   srac008_1                 LIKE srac_t.srac006,
   srac008_1_desc            LIKE type_t.chr500,
   srac009                   LIKE srac_t.srac009
       END RECORD
 TYPE type_g_srac2_d RECORD
   chk2                      LIKE type_t.chr500,
   srac004_2                 LIKE srac_t.srac004,
   srac031                   LIKE srac_t.srac030,
   srac004_2_desc            LIKE type_t.chr500,
   srac004_2_desc_1          LIKE type_t.chr500,
   srac005                   LIKE srac_t.srac005,
   srac006                   LIKE srac_t.srac006,
   srac008_2                 LIKE srac_t.srac006,
   srac008_2_desc            LIKE type_t.chr500,
   srac009                   LIKE srac_t.srac009
       END RECORD

 TYPE type_g_srac3_d RECORD
   chk3                      LIKE type_t.chr500,
   srac004_3                 LIKE srac_t.srac004,
   srac032                   LIKE srac_t.srac030,
   srac004_3_desc            LIKE type_t.chr500,
   srac004_3_desc_1          LIKE type_t.chr500,
   srac005                   LIKE srac_t.srac005,
   srac006                   LIKE srac_t.srac006,
   srac008_3                 LIKE srac_t.srac006,
   srac008_3_desc            LIKE type_t.chr500,
   srac009                   LIKE srac_t.srac009
       END RECORD

 TYPE type_g_srac4_d RECORD
   chk4                      LIKE type_t.chr500,
   srac004_4                 LIKE srac_t.srac004,
   srac034                   LIKE srac_t.srac030,
   srac004_4_desc            LIKE type_t.chr500,
   srac004_4_desc_1          LIKE type_t.chr500,
   srac005                   LIKE srac_t.srac005,
   srac006                   LIKE srac_t.srac006,
   srac008_4                 LIKE srac_t.srac006,
   srac008_4_desc            LIKE type_t.chr500,
   srac009                   LIKE srac_t.srac009
       END RECORD

 TYPE type_g_srac5_d RECORD
   chk5                      LIKE type_t.chr500,
   srac004_5                 LIKE srac_t.srac004,
   srac035                   LIKE srac_t.srac030,
   srac004_5_desc            LIKE type_t.chr500,
   srac004_5_desc_1          LIKE type_t.chr500,
   srac005                   LIKE srac_t.srac005,
   srac006                   LIKE srac_t.srac006,
   srac008_5                 LIKE srac_t.srac006,
   srac008_5_desc            LIKE type_t.chr500,
   srac009                   LIKE srac_t.srac009
       END RECORD



#無單身append欄位定義

#模組變數(Module Variables)
DEFINE g_sffb_m          type_g_sffb_m
DEFINE g_sffb_m_t        type_g_sffb_m
DEFINE g_sffb_m1         type_g_sffb_m1
DEFINE g_sffb_m1_t       type_g_sffb_m1
DEFINE g_srac_d          DYNAMIC ARRAY OF type_g_srac_d 
DEFINE g_srac_d_t        type_g_srac_d
DEFINE g_srac2_d         DYNAMIC ARRAY OF type_g_srac2_d 
DEFINE g_srac2_d_t       type_g_srac2_d
DEFINE g_srac3_d         DYNAMIC ARRAY OF type_g_srac3_d 
DEFINE g_srac3_d_t       type_g_srac3_d				         
DEFINE g_srac4_d         DYNAMIC ARRAY OF type_g_srac4_d 
DEFINE g_srac4_d_t       type_g_srac4_d				         
DEFINE g_srac5_d         DYNAMIC ARRAY OF type_g_srac5_d 
DEFINE g_srac5_d_t       type_g_srac5_d
DEFINE g_sffd_d          DYNAMIC ARRAY OF type_g_sffd_d
DEFINE g_sffd_d_t        type_g_sffd_d
DEFINE g_sffc_d          DYNAMIC ARRAY OF type_g_sffc_d
DEFINE g_sffc_d_t        type_g_sffc_d
#以下2变量是存放刷新时，前次选中的单身资料的，用来保持报工咨讯页签的资料不被刷掉
DEFINE g_srac            type_g_srac_d
DEFINE g_sffb001         LIKE sffb_t.sffb001

DEFINE g_wc                 STRING
DEFINE g_wc0                STRING
DEFINE g_wc1                STRING
DEFINE g_wc2                STRING
DEFINE g_wc3                STRING
DEFINE g_wc4                STRING
DEFINE g_wc5                STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10
DEFINE g_rec_b              LIKE type_t.num5 
DEFINE l_ac                 LIKE type_t.num5
DEFINE l_ac2                LIKE type_t.num5
DEFINE l_ac3                LIKE type_t.num5
DEFINE l_ac4                LIKE type_t.num5
DEFINE l_ac5                LIKE type_t.num5
DEFINE l_ac6                LIKE type_t.num5
DEFINE l_ac7                LIKE type_t.num5
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
DEFINE g_calc_field         LIKE type_t.chr10             #画面上计算器用的全局变量
DEFINE g_calc_amt           STRING                        #画面上计算器用的全局变量
DEFINE g_countdown          LIKE type_t.num5              #刷新按钮的倒计时
DEFINE g_msg                STRING
DEFINE g_doc_slip           LIKE sffb_t.sffbdocno
DEFINE g_sffbdocno          LIKE sffb_t.sffbdocno         #存放自动编号出来的报工单号
DEFINE g_time1              DATETIME YEAR TO SECOND
DEFINE g_time2              STRING
DEFINE g_time3              STRING
{</Module define>}
#end add-point
 
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
{</section>}
 
{<section id="asrp330.main" >}
#+ 作業開始
MAIN
   #add-point:main段define name="main.define"
      
   #end add-point    
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point
 
   #定義在其他link的程式則無效
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("asr","")
 
   #add-point:作業初始化 name="main.init"
      
   #end add-point
 
   #add-point:SQL_define name="main.define_sql"
      #   LET g_forupd_sql = ""
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)    #轉換不同資料庫語法
   DECLARE asrp330_cl CURSOR FROM g_forupd_sql 
   
   IF g_bgjob = "Y" THEN
 
      #add-point:Service Call name="main.servicecall"
            
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asrp330 WITH FORM cl_ap_formpath("asr",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL asrp330_init()
 
      #進入選單 Menu (='N')
      CALL asrp330_ui_dialog()
   
      #畫面關閉
      CLOSE WINDOW w_asrp330
   END IF
 
   #add-point:作業離開前 name="main.exit"
      
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
 
END MAIN
 
{</section>}
 
{<section id="asrp330.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

PRIVATE FUNCTION asrp330_init()
   #add-point:init段define
   
   #end add-point

   LET g_error_show = 1
 


   #add-point:畫面資料初始化

   #CALL cl_set_combo_scc('sffb001_1','4020')  #161228-00028#2 mark
   CALL cl_set_combo_scc('sffb001_1','4021')  #161228-00028#2
   CALL asrp330_set_sffb013_format()
   LET g_today = cl_get_today()
   CALL cl_set_combo_scc('sffc002','1201') 
   CALL gfrm_curr.setElementImage("ins_sffb", "stus/32/unconfirmed.png")
   #end add-point


END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_ui_dialog()
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_ac_t                LIKE type_t.num5                #未取消的ARRAY CNT
   DEFINE  l_n                   LIKE type_t.num5                #檢查重複用
   DEFINE  l_cnt                 LIKE type_t.num5                #檢查重複用
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否
   DEFINE  l_count               LIKE type_t.num5
   DEFINE  l_i                   LIKE type_t.num5
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num5
   DEFINE  li_reproduce_target   LIKE type_t.num5
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_cnt1                LIKE type_t.num5
   DEFINE  l_sfaa061             LIKE sfaa_t.sfaa061
   DEFINE  l_sffb006             LIKE sffb_t.sffb006
   DEFINE  l_sffb009             LIKE sffb_t.sffb009
   DEFINE  l_sffb014             LIKE sffb_t.sffb014
   DEFINE  l_sffb015             LIKE sffb_t.sffb015
   DEFINE  l_sffb017             LIKE sffb_t.sffb017
   DEFINE  l_sffb018             LIKE sffb_t.sffb018
   DEFINE  l_sffb019             LIKE sffb_t.sffb019
   DEFINE  l_sffb020             LIKE sffb_t.sffb020
   DEFINE  l_sffb029             LIKE sffb_t.sffb029
   DEFINE  l_hhmmss              STRING

   LET g_action_choice = ""

   LET g_qryparam.state = "i"

   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   

   LET INT_FLAG = 0
   
   WHILE TRUE
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      #單頭段
      INPUT BY NAME g_sffb_m.sffb025,g_sffb_m.sffb009,g_sffb_m.sffb007,g_sffb_m.sffbdocno,g_sffb_m.sffb004,g_sffb_m.sffb010,g_sffb_m.sffb002,g_sffb_m.sffb003,g_sffb_m.sffb024,g_sffb_m.sffb011
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
     
         BEFORE INPUT
            #add-point:資料輸入前
            CALL asrp330_set_sffb013_format()
            INITIALIZE g_sffb_m1.* TO NULL
            LET g_sffb_m1.sffb014 = 0
            LET g_sffb_m1.sffb015 = 0
            LET g_sffb_m1.sffb017 = 0 
            LET g_sffb_m1.sffb018 = 0
            LET g_sffb_m1.sffb019 = 0
            LET g_sffb_m1.sffb020 = 0
            
            IF g_sffb_m.sffbdocno IS NULL THEN
               LET g_sffb_m.sffbdocno = cl_get_para(g_enterprise,g_site,'S-MFG-0035')
               LET g_sffb_m.sffbdocno_desc = s_aooi200_get_slip_desc(g_sffb_m.sffbdocno)
               DISPLAY BY NAME g_sffb_m.sffbdocno_desc
            END IF
            LET g_sffb_m.sffb011   = 1
            LET g_sffb_m.sffb002 = g_user
            LET g_sffb_m.sffb002_desc = s_desc_get_person_desc(g_sffb_m.sffb002)
            DISPLAY BY NAME g_sffb_m.sffb002_desc
            LET g_sffb_m.sffb003 = g_dept
            LET g_sffb_m.sffb003_desc = s_desc_get_department_desc(g_sffb_m.sffb003)
            DISPLAY BY NAME g_sffb_m.sffb003_desc
            CALL cl_set_act_visible("accept,cancel",TRUE)
            LET g_sffb001 = NULL
            INITIALIZE g_srac.* TO NULL
            INITIALIZE g_sffb_m1.* TO NULL
            CALL g_sffd_d.clear()
            CALL g_sffc_d.clear()
            LET g_calc_field = NULL
            LET g_calc_amt   = NULL 
            #end add-point
 
         #---------------------------<  Master  >---------------------------
          #----<<sffbdocno>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb025
           #add-point:AFTER FIELD sffb025
           IF NOT cl_null(g_sffb_m.sffb025) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_sffb_m.sffb025
               #160318-00025#34  2016/04/14  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗
               LET g_chkparam.err_str[1] = "asr-00014:sub-01302|asri001|",cl_get_progname("asri001",g_lang,"2"),"|:EXEPROGasri001"
               #160318-00025#34  2016/04/14  by pengxin  add(E)
               IF cl_chk_exist("v_srza001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_sffb_m.sffb025
               CALL ap_ref_array2(g_ref_fields,"SELECT srza002 FROM srza_t WHERE srzaent='"||g_enterprise||"' AND srza001=? ","") RETURNING g_rtn_fields
               LET g_sffb_m.sffb025_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_sffb_m.sffb025_desc
           END IF 
#           CALL asrp330_set_required()
            
            #END add-point

         #此段落由子樣板a01產生
         BEFORE FIELD sffb025
            #add-point:BEFORE FIELD sffb025
            CALL asrp330_set_no_required()
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb025
            #add-point:ON CHANGE sffb025

            #END add-point
 
 
         #----<<sffbdocno>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffbdocno
            
            #add-point:AFTER FIELD sffbdocno
            IF NOT cl_null(g_sffb_m.sffbdocno) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m_t.sffbdocno IS NULL OR g_sffb_m.sffbdocno <> g_sffb_m_t.sffbdocno)) THEN 
                  IF NOT s_aooi200_chk_docno(g_site,g_sffb_m.sffbdocno,cl_get_today(),'asrt335') THEN
                     LET g_sffb_m.sffbdocno = NULL
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF 
            CALL asrp330_set_required()
            LET g_sffb_m.sffbdocno_desc = s_aooi200_get_slip_desc(g_sffb_m.sffbdocno)
            DISPLAY BY NAME g_sffb_m.sffbdocno_desc

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffbdocno
            #add-point:BEFORE FIELD sffbdocno
            CALL asrp330_set_no_required()
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffbdocno
            #add-point:ON CHANGE sffbdocno

            #END add-point
 
 
         #----<<sffb002>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb002
            
            #add-point:AFTER FIELD sffb002
            IF NOT cl_null(g_sffb_m.sffb002) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m_t.sffb002 IS NULL OR g_sffb_m.sffb002 <> g_sffb_m_t.sffb002)) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sffb_m.sffb002
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooag001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
   
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sffb_m.sffb002 = g_sffb_m_t.sffb002
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            LET g_sffb_m.sffb002_desc = s_desc_get_person_desc(g_sffb_m.sffb002)
            DISPLAY BY NAME g_sffb_m.sffb002_desc
            CALL s_aooi200_get_slip(g_sffb_m.sffbdocno) RETURNING l_success,g_doc_slip
            IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0068') ='Y' THEN 
               IF p_cmd ='a' OR (p_cmd = 'u' AND (g_sffb_m_t.sffb002 IS NULL OR g_sffb_m.sffb002 != g_sffb_m_t.sffb002)) THEN
                  #170207-00018#5    2017/02/13    By 08734 mark(S)
                  #SELECT oogf001 INTO g_sffb_m.sffb024
                  #  FROM oogf_t 
                  # WHERE oogfent  = g_enterprise
                  #   AND oogfsite = g_site
                  #   AND oogf002  = g_sffb_m.sffb002
                  #   AND oogfstus = 'Y'
                  #   AND oogf003 <= g_today
                  #   AND ROWNUM <=1
                  # ORDER BY oogf001
                  #170207-00018#5    2017/02/13    By 08734 mark(E) 
                  #170207-00018#5    2017/02/13    By 08734 add(S)
                   SELECT A.oogf001 INTO g_sffb_m.sffb024 FROM(SELECT oogf001 
                    FROM oogf_t 
                   WHERE oogfent  = g_enterprise
                     AND oogfsite = g_site
                     AND oogf002  = g_sffb_m.sffb002
                     AND oogfstus = 'Y'
                     AND oogf003 <= g_today
                   ORDER BY oogf001) A
                   WHERE ROWNUM <=1
                  #170207-00018#5    2017/02/13    By 08734 add(E)
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_site
                  LET g_ref_fields[2] = g_sffb_m.sffb024
                  CALL ap_ref_array2(g_ref_fields,"SELECT ooge002 FROM ooge_t WHERE oogeent='"||g_enterprise||"' AND oogesite=? AND ooge001=? ","") RETURNING g_rtn_fields
                  LET g_sffb_m.sffb024_desc = '', g_rtn_fields[1] , ''
                  DISPLAY BY NAME g_sffb_m.sffb024_desc 
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb002
            #add-point:BEFORE FIELD sffb002

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb002
            #add-point:ON CHANGE sffb002

            #END add-point
 

         #----<<sffb003>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb003
            
            #add-point:AFTER FIELD sffb003
            IF NOT cl_null(g_sffb_m.sffb003) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sffb_m_t.sffb003 IS NULL OR g_sffb_m.sffb003 != g_sffb_m_t.sffb003)) THEN 
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sffb_m.sffb003
                  LET g_chkparam.arg2 = g_today
			         LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooeg001_3") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sffb_m.sffb003 = g_sffb_m_t.sffb003
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            LET g_sffb_m.sffb003_desc = s_desc_get_department_desc(g_sffb_m.sffb003)
            DISPLAY BY NAME g_sffb_m.sffb003_desc
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb003
            #add-point:BEFORE FIELD sffb003

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb003
            #add-point:ON CHANGE sffb003

            #END add-point
 
 
         #----<<sffb009>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb009
            
            #add-point:AFTER FIELD sffb009
            IF NOT cl_null(g_sffb_m.sffb009) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m_t.sffb009 IS NULL OR g_sffb_m.sffb009 != g_sffb_m_t.sffb009)) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_sffb_m.sffb009
                  
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ecaa001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
                  
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sffb_m.sffb009 = g_sffb_m_t.sffb009
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_site
            LET g_ref_fields[2] = g_sffb_m.sffb009
            CALL ap_ref_array2(g_ref_fields,"SELECT ecaa002 FROM ecaa_t WHERE ecaaent='"||g_enterprise||"' AND ecaasite=? AND ecaa001=? ","") RETURNING g_rtn_fields
            LET g_sffb_m.sffb009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffb_m.sffb009_desc
            #END add-point

         #----<<sffb007>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb007
            
            #add-point:AFTER FIELD sffb007
            IF g_sffb_m.sffb007 IS NOT NULL THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m_t.sffb007 IS NULL OR g_sffb_m.sffb007 != g_sffb_m_t.sffb007)) THEN 
#此段落由子樣板a19產生
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = '221'
                  LET g_chkparam.arg2 = g_sffb_m.sffb007
                  LET g_chkparam.err_str[1] = "aqc-00032:sub-01302|aqci030|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
               #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_oocq002_1") THEN
                  ELSE
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sffb_m.sffb007
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sffb_m.sffb007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffb_m.sffb007_desc
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb007
            #add-point:BEFORE FIELD sffb007

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb007
            #add-point:ON CHANGE sffb007


 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb009
            #add-point:BEFORE FIELD sffb009

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb009
            #add-point:ON CHANGE sffb009

            #END add-point
 
         #----<<sffb004>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb004
            
            #add-point:AFTER FIELD sffb004
            IF NOT cl_null(g_sffb_m.sffb004) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m_t.sffb004 IS NULL OR g_sffb_m.sffb004 <> g_sffb_m_t.sffb004)) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_sffb_m.sffb004
                  
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_oogd001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
                  
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sffb_m.sffb004 = g_sffb_m_t.sffb004
                     NEXT FIELD CURRENT
                  END IF
               END IF

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_site
            LET g_ref_fields[2] = g_sffb_m.sffb004
            CALL ap_ref_array2(g_ref_fields,"SELECT oogd002 FROM oogd_t WHERE oogdent='"||g_enterprise||"' AND oogdsite=? AND oogd001=? ","") RETURNING g_rtn_fields
            LET g_sffb_m.sffb004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffb_m.sffb004_desc

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb004
            #add-point:BEFORE FIELD sffb004

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb004
            #add-point:ON CHANGE sffb004

            #END add-point
 
         #----<<sffb010>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb010
            
            #add-point:AFTER FIELD sffb010
            IF NOT cl_null(g_sffb_m.sffb010) THEN 
               IF p_cmd ='a' OR (p_cmd = 'u' AND (g_sffb_m_t.sffb010 IS NULL OR g_sffb_m.sffb010 <> g_sffb_m_t.sffb010)) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sffb_m.sffb010
			      
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_mrba001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sffb_m.sffb010 = g_sffb_m_t.sffb010
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sffb_m.sffb010
            CALL ap_ref_array2(g_ref_fields,"SELECT mrba004 FROM mrba_t WHERE mrbaent='"||g_enterprise||"' AND mrbasite = '"||g_site||"' AND mrba001=? ","") RETURNING g_rtn_fields
            LET g_sffb_m.sffb010_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffb_m.sffb010_desc

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb010
            #add-point:BEFORE FIELD sffb010

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb010
            #add-point:ON CHANGE sffb010

            #END add-point
 
         #----<<sffb024>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb024
            
            #add-point:AFTER FIELD sffb024
            IF NOT cl_null(g_sffb_m.sffb024) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m_t.sffb024 IS NULL OR g_sffb_m.sffb024 != g_sffb_m_t.sffb024)) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_sffb_m.sffb024
                  LET g_chkparam.err_str[1] = "aoo-00068:sub-01302|aooi427|",cl_get_progname("aooi427",g_lang,"2"),"|:EXEPROGaooi427"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooge001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
                  
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sffb_m.sffb024 = g_sffb_m_t.sffb024
                     NEXT FIELD CURRENT
                  END IF
#预设人数，这个组别在aooi428里，日期有效的条件下的人数

                  SELECT COUNT(oogf002) INTO l_cnt
                    FROM oogf_t
                   WHERE oogfent  = g_enterprise
                     AND oogfsite = g_site
                     AND oogf001  = g_sffb_m.sffb024
                     AND oogfstus = 'Y'
                     AND oogf003 <= g_today
                   IF l_cnt IS NULL THEN LET l_cnt = 0 END IF
#因为失效日期可能输可能没输，所以前面只统计大于等于生效日期的人数是不准的，还要减掉大于等于失效日期的人数
                  SELECT COUNT(oogf002) INTO l_cnt1
                    FROM oogf_t
                   WHERE oogfent  = g_enterprise
                     AND oogfsite = g_site
                     AND oogf001  = g_sffb_m.sffb024
                     AND oogfstus = 'Y'
                     AND oogf004 <= g_today
                  IF l_cnt1 IS NULL THEN LET l_cnt1 = 0 END IF
                  LET g_sffb_m.sffb011 = l_cnt - l_cnt1
                  DISPLAY BY NAME g_sffb_m.sffb011
               END IF
            ELSE
               CALL s_aooi200_get_slip(g_sffb_m.sffbdocno) RETURNING l_success,g_doc_slip
               IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0068') ='Y' THEN
                  
                  NEXT FIELD CURRENT
               ELSE
#组别为空的时候，预设人数为1 
                  IF g_sffb_m.sffb011 IS NULL OR g_sffb_m.sffb011 = 0 THEN
                     LET g_sffb_m.sffb011 = 1
                     DISPLAY BY NAME g_sffb_m.sffb011
                  END IF
               END IF
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_site
            LET g_ref_fields[2] = g_sffb_m.sffb024
            CALL ap_ref_array2(g_ref_fields,"SELECT ooge002 FROM ooge_t WHERE oogeent='"||g_enterprise||"' AND oogesite=? AND ooge001=? ","") RETURNING g_rtn_fields
            LET g_sffb_m.sffb024_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffb_m.sffb024_desc

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb024
            #add-point:BEFORE FIELD sffb024

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb024
            #add-point:ON CHANGE sffb024

            #END add-point
 
         #----<<sffb011>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb011
            #此段落由子樣板a15產生
            IF NOT cl_ap_chk_Range(g_sffb_m.sffb011,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sffb011
            END IF
 
 
            #add-point:AFTER FIELD sffb011
            IF cl_null(g_sffb_m.sffb011) THEN 
               NEXT FIELD sffb011
            END IF 

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb011
            #add-point:BEFORE FIELD sffb011

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb011
            #add-point:ON CHANGE sffb011

            #END add-point
 

         ON ACTION controlp INFIELD sffbdocno
            #add-point:ON ACTION controlp INFIELD sffbdocno
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		      	LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffbdocno             #給予default值

            #給予arg
            SELECT ooef004 INTO l_ooef004 
              FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_site
               
            LET g_qryparam.arg1 = l_ooef004          #
            LET g_qryparam.arg2 = 'asrt335'    

            CALL q_ooba002_1()                                #呼叫開窗
          
            LET g_sffb_m.sffbdocno = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffbdocno TO sffbdocno              #顯示到畫面上

            NEXT FIELD sffbdocno                          #返回原欄位


            #END add-point

         #----<<sffb002>>----
         #Ctrlp:input.c.sffb002
         ON ACTION controlp INFIELD sffb002
            #add-point:ON ACTION controlp INFIELD sffb002
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		      	LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb002             #給予default值

            #給予arg

            CALL q_ooag001_4()                                #呼叫開窗

            LET g_sffb_m.sffb002 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffb002 TO sffb002              #顯示到畫面上

            NEXT FIELD sffb002                          #返回原欄位


            #END add-point
 
 
         #----<<sffb003>>----
         #Ctrlp:input.c.sffb003
         ON ACTION controlp INFIELD sffb003
            #add-point:ON ACTION controlp INFIELD sffb003
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		      	LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_today

            CALL q_ooeg001()                                #呼叫開窗

            LET g_sffb_m.sffb003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffb003 TO sffb003              #顯示到畫面上

            NEXT FIELD sffb003                          #返回原欄位


            #END add-point
 
         #----<<sffb009>>----
         #Ctrlp:input.c.sffb009
         ON ACTION controlp INFIELD sffb009
            #add-point:ON ACTION controlp INFIELD sffb009
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		      	LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb009             #給予default值

            #給予arg

            CALL q_ecaa001_1()                                #呼叫開窗

            LET g_sffb_m.sffb009 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffb009 TO sffb009              #顯示到畫面上

            NEXT FIELD sffb009                          #返回原欄位


            #END add-point
 
         #----<<sffb004>>----
         #Ctrlp:input.c.sffb004
         ON ACTION controlp INFIELD sffb004
            #add-point:ON ACTION controlp INFIELD sffb004
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		      	LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb004             #給予default值

            #給予arg

            CALL q_oogd001_01()                                #呼叫開窗

            LET g_sffb_m.sffb004 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffb004 TO sffb004              #顯示到畫面上

            NEXT FIELD sffb004                          #返回原欄位


            #END add-point
 
         #----<<sffb010>>----
         #Ctrlp:input.c.sffb010
         ON ACTION controlp INFIELD sffb010
            #add-point:ON ACTION controlp INFIELD sffb010
                                    #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb010             #給予default值
            LET g_qryparam.where = " mrbasite ='",g_site,"' "
            #給予arg

            CALL q_mrba001()                                #呼叫開窗

            LET g_sffb_m.sffb010 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffb010 TO sffb010              #顯示到畫面上

            NEXT FIELD sffb010                          #返回原欄位


            #END add-point
 
         #----<<sffb024>>----
         #Ctrlp:input.c.sffb024
         ON ACTION controlp INFIELD sffb024
            #add-point:ON ACTION controlp INFIELD sffb024
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			      LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb024             #給予default值

            #給予arg

            CALL q_ooge001()                                #呼叫開窗

            LET g_sffb_m.sffb024 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffb_m.sffb024 TO sffb024              #顯示到畫面上

            NEXT FIELD sffb024                          #返回原欄位


            #END add-point

         #----<<sffb007>>----
         #Ctrlp:input.c.sffb007
         ON ACTION controlp INFIELD sffb007
            #add-point:ON ACTION controlp INFIELD sffb007
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = '221'

            LET g_qryparam.default1 = g_sffb_m.sffb007             #給予default值

            #給予arg

            CALL q_oocq002()                                #呼叫開窗

            LET g_sffb_m.sffb007 = g_qryparam.return1              #將開窗取得的值回傳到變數


            NEXT FIELD sffb007                         #返回原欄位


            #END add-point
            
         #----<<sffb011>>----
         #Ctrlp:input.c.sffb011
         ON ACTION controlp INFIELD sffb011
            #add-point:ON ACTION controlp INFIELD sffb011

            #END add-point
 
         #----<<sffb012>>----
         #Ctrlp:input.c.sffb012
         ON ACTION controlp INFIELD sffb012
            #add-point:ON ACTION controlp INFIELD sffb012

            #END add-point
         
         #----<<sffb025>>----
         #Ctrlp:input.c.sffb025
         ON ACTION controlp INFIELD sffb025
            #add-point:ON ACTION controlp INFIELD sffb025
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m.sffb025             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

            CALL q_srza001()                                #呼叫開窗

            LET g_sffb_m.sffb025 = g_qryparam.return1              

            DISPLAY g_sffb_m.sffb025 TO sffb025              #
            NEXT FIELD sffb025                               #返回原欄位
            #END add-point
 
         #----<<sffbownid>>----
         #----<<sffbowndp>>----
         #----<<sffbcrtid>>----
         #----<<sffbcrtdp>>----
         #----<<sffbcrtdt>>----
         #----<<sffbmodid>>----
         #----<<sffbmoddt>>----
         #----<<sffbcnfid>>----
         #----<<sffbcnfdt>>----
         #----<<sffbpstid>>----
         #----<<sffbpstdt>>----
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            CALL cl_showmsg()      #錯誤訊息統整顯示
            
#不需要数据库异动，只要组一个where条件，给后续的detail们用来查询资料即可
            CALL asrp330_refresh()
            
      END INPUT
      
      #Page1 預設值產生於此處
      INPUT ARRAY g_srac_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = l_allow_insert,
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)

         #自訂ACTION(detail_input,page_1)


         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN
              CALL FGL_SET_ARR_CURR(g_srac_d.getLength()+1)
              LET g_insert = 'N'
           END IF

            LET g_detail_cnt = g_srac_d.getLength()
            #add-point:資料輸入前
            CALL cl_set_act_visible("accept,cancel",FALSE)

            #end add-point
			
         BEFORE ROW
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_n TO FORMONLY.idx
            LET g_master_idx = l_ac

            LET g_detail_cnt = g_srac_d.getLength()

            IF g_detail_cnt >= l_ac
            THEN
               LET l_cmd='u'
               LET g_srac_d_t.* = g_srac_d[l_ac].*  #BACKUP
               CALL cl_show_fld_cont()
            ELSE
               LET l_cmd='a'
            END IF
            CALL asrp330_set_entry_b(l_cmd)
            CALL asrp330_set_no_entry_b(l_cmd)
 
         ON CHANGE chk1
#表示改成了Y，要先检查一下是否5个单身有别的Y，有的话，报错退出，没有的话，产生报工咨讯页签资料，并光标定位到工时栏位
            IF g_srac_d[l_ac].chk1 ='Y' THEN 
               CALL asrp330_set_srac_detail_n()
               LET g_srac_d[l_ac].chk1 ='Y'
               CALL asrp330_gen_sffb_m1('1',g_srac_d[l_ac].*)
               #LET g_sffb001 = '1'   #161228-00028#2
               LET g_sffb001 = '11'   #161228-00028#2
               LET g_srac.*  = g_srac_d[l_ac].*    #备份，在刷新时如果有内容，则插入显示
#是否要show一次？不确定，看dialog是unbuffer的，应该不用了吧
               NEXT FIELD sffb014_1
            ELSE
#清空报工咨讯页签等 
               IF asrp330_chk_count() = 0 THEN
                  LET g_sffb001 = NULL
                  INITIALIZE g_srac.* TO NULL
                  INITIALIZE g_sffb_m1.* TO NULL
                  CALL g_sffd_d.clear()
                  CALL g_sffc_d.clear()
               END IF
            END IF
         
         AFTER ROW
            IF g_srac_d[l_ac].chk1 ='Y' THEN
               NEXT FIELD sffb014_1
            END IF

         ON ACTION controlo
            CALL FGL_SET_ARR_CURR(g_srac_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac
            LET li_reproduce_target = g_srac_d.getLength()+1
			
      END INPUT
      

      #Page1 預設值產生於此處
      INPUT ARRAY g_srac2_d FROM s_detail2.*
          ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = l_allow_insert,
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)

         #自訂ACTION(detail_input,page_1)


         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN
              CALL FGL_SET_ARR_CURR(g_srac2_d.getLength()+1)
              LET g_insert = 'N'
           END IF

            LET g_detail_cnt = g_srac2_d.getLength()
            #add-point:資料輸入前
            CALL cl_set_act_visible("accept,cancel",FALSE)

            #end add-point
			
         BEFORE ROW
            LET l_cmd = ''
            LET l_ac2 = ARR_CURR()
            LET g_detail_idx = l_ac2
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_n TO FORMONLY.idx
            LET g_master_idx = l_ac2

            LET g_detail_cnt = g_srac2_d.getLength()

            IF g_detail_cnt >= l_ac2
            THEN
               LET l_cmd='u'
               LET g_srac2_d_t.* = g_srac2_d[l_ac2].*  #BACKUP
               CALL cl_show_fld_cont()
            ELSE
               LET l_cmd='a'
            END IF
            CALL asrp330_set_entry_b(l_cmd)
            CALL asrp330_set_no_entry_b(l_cmd)


         ON CHANGE chk2
#表示改成了Y，要先检查一下是否5个单身有别的Y，有的话，报错退出，没有的话，产生报工咨讯页签资料，并光标定位到工时栏位
            IF g_srac2_d[l_ac2].chk2 ='Y' THEN 
               CALL asrp330_set_srac_detail_n()
               LET g_srac2_d[l_ac2].chk2 ='Y'
               CALL asrp330_gen_sffb_m1('2',g_srac2_d[l_ac2].*)
               #LET g_sffb001 = '2'    #161228-00028#2
               LET g_sffb001 = '12'    #161228-00028#2
               LET g_srac.*  = g_srac2_d[l_ac2].*
#是否要show一次？不确定，看dialog是unbuffer的，应该不用了吧
               NEXT FIELD sffb014_1
            ELSE
#清空报工咨讯页签等 
               IF asrp330_chk_count() = 0 THEN
                  LET g_sffb001 = NULL
                  INITIALIZE g_srac.* TO NULL
                  INITIALIZE g_sffb_m1.* TO NULL
                  CALL g_sffd_d.clear()
                  CALL g_sffc_d.clear()
               END IF
            END IF
            
            
         AFTER ROW
            IF g_srac2_d[l_ac2].chk2 ='Y' THEN
               NEXT FIELD sffb014_1
            END IF

         ON ACTION controlo
            CALL FGL_SET_ARR_CURR(g_srac2_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac2
            LET li_reproduce_target = g_srac2_d.getLength()+1
			
      END INPUT


      #Page1 預設值產生於此處
      INPUT ARRAY g_srac3_d FROM s_detail3.*
          ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = l_allow_insert,
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)

         #自訂ACTION(detail_input,page_1)


         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN
              CALL FGL_SET_ARR_CURR(g_srac3_d.getLength()+1)
              LET g_insert = 'N'
           END IF

            LET g_detail_cnt = g_srac3_d.getLength()
            #add-point:資料輸入前
            CALL cl_set_act_visible("accept,cancel",FALSE)

            #end add-point

         BEFORE ROW
            LET l_cmd = ''
            LET l_ac3 = ARR_CURR()
            LET g_detail_idx = l_ac3
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_n TO FORMONLY.idx
            LET g_master_idx = l_ac3

            LET g_detail_cnt = g_srac3_d.getLength()

            IF g_detail_cnt >= l_ac3
            THEN
               LET l_cmd='u'
               LET g_srac3_d_t.* = g_srac3_d[l_ac3].*  #BACKUP
               CALL cl_show_fld_cont()
            ELSE
               LET l_cmd='a'
            END IF
            CALL asrp330_set_entry_b(l_cmd)
            CALL asrp330_set_no_entry_b(l_cmd)

         ON CHANGE chk3
#表示改成了Y，要先检查一下是否5个单身有别的Y，有的话，报错退出，没有的话，产生报工咨讯页签资料，并光标定位到工时栏位
            IF g_srac3_d[l_ac3].chk3 ='Y' THEN 
               CALL asrp330_set_srac_detail_n()
               LET g_srac3_d[l_ac3].chk3 ='Y'
               CALL asrp330_gen_sffb_m1('3',g_srac3_d[l_ac3].*)
               #LET g_sffb001 = '3'   #161228-00028#2
               LET g_sffb001 = '13'  #161228-00028#2
               LET g_srac.*  = g_srac3_d[l_ac3].*
#是否要show一次？不确定，看dialog是unbuffer的，应该不用了吧
               NEXT FIELD sffb014_1
            ELSE
#清空报工咨讯页签等 
               IF asrp330_chk_count() = 0 THEN
                  LET g_sffb001 = NULL
                  INITIALIZE g_srac.* TO NULL
                  INITIALIZE g_sffb_m1.* TO NULL
                  CALL g_sffd_d.clear()
                  CALL g_sffc_d.clear()
               END IF
            END IF

         AFTER ROW
            IF g_srac3_d[l_ac3].chk3 ='Y' THEN
               NEXT FIELD sffb014_1
            END IF

         ON ACTION controlo
            CALL FGL_SET_ARR_CURR(g_srac3_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac3
            LET li_reproduce_target = g_srac3_d.getLength()+1
			
      END INPUT


      #Page1 預設值產生於此處
      INPUT ARRAY g_srac4_d FROM s_detail4.*
          ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = l_allow_insert,
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)

         #自訂ACTION(detail_input,page_1)


         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN
              CALL FGL_SET_ARR_CURR(g_srac4_d.getLength()+1)
              LET g_insert = 'N'
           END IF

            LET g_detail_cnt = g_srac4_d.getLength()
            #add-point:資料輸入前
            CALL cl_set_act_visible("accept,cancel",FALSE)

            #end add-point
			
         BEFORE ROW
            LET l_cmd = ''
            LET l_ac4 = ARR_CURR()
            LET g_detail_idx = l_ac4
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_n TO FORMONLY.idx
            LET g_master_idx = l_ac4

            LET g_detail_cnt = g_srac4_d.getLength()

            IF g_detail_cnt >= l_ac4
            THEN
               LET l_cmd='u'
               LET g_srac4_d_t.* = g_srac4_d[l_ac4].*  #BACKUP
               CALL cl_show_fld_cont()
            ELSE
               LET l_cmd='a'
            END IF
            CALL asrp330_set_entry_b(l_cmd)
            CALL asrp330_set_no_entry_b(l_cmd)

         ON CHANGE chk4
#表示改成了Y，要先检查一下是否5个单身有别的Y，有的话，报错退出，没有的话，产生报工咨讯页签资料，并光标定位到工时栏位
            IF g_srac4_d[l_ac4].chk4 ='Y' THEN 
               CALL asrp330_set_srac_detail_n()
               LET g_srac4_d[l_ac4].chk4 ='Y'
               CALL asrp330_gen_sffb_m1('4',g_srac4_d[l_ac4].*)
               #LET g_sffb001 = '4'  #161228-00028#2
               LET g_sffb001 = '14'  #161228-00028#2
               LET g_srac.*  = g_srac4_d[l_ac4].*
#是否要show一次？不确定，看dialog是unbuffer的，应该不用了吧
               NEXT FIELD sffb014_1
            ELSE
#清空报工咨讯页签等 
               IF asrp330_chk_count() = 0 THEN
                  LET g_sffb001 = NULL
                  INITIALIZE g_srac.* TO NULL
                  INITIALIZE g_sffb_m1.* TO NULL
                  CALL g_sffd_d.clear()
                  CALL g_sffc_d.clear()
               END IF
            END IF

         AFTER ROW
            IF g_srac4_d[l_ac4].chk4 ='Y' THEN
               NEXT FIELD sffb014_1
            END IF

         ON ACTION controlo
            CALL FGL_SET_ARR_CURR(g_srac4_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac4
            LET li_reproduce_target = g_srac4_d.getLength()+1
			
      END INPUT

      #Page1 預設值產生於此處
      INPUT ARRAY g_srac5_d FROM s_detail5.*
          ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = l_allow_insert,
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)

         #自訂ACTION(detail_input,page_1)


         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN
              CALL FGL_SET_ARR_CURR(g_srac5_d.getLength()+1)
              LET g_insert = 'N'
           END IF

            LET g_detail_cnt = g_srac5_d.getLength()
            #add-point:資料輸入前
            CALL cl_set_act_visible("accept,cancel",FALSE)

            #end add-point
			
         BEFORE ROW
            LET l_cmd = ''
            LET l_ac5 = ARR_CURR()
            LET g_detail_idx = l_ac5
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_n TO FORMONLY.idx
            LET g_master_idx = l_ac5

            LET g_detail_cnt = g_srac5_d.getLength()

            IF g_detail_cnt >= l_ac5
            THEN
               LET l_cmd='u'
               LET g_srac5_d_t.* = g_srac5_d[l_ac5].*  #BACKUP
               CALL cl_show_fld_cont()
            ELSE
               LET l_cmd='a'
            END IF
            CALL asrp330_set_entry_b(l_cmd)
            CALL asrp330_set_no_entry_b(l_cmd)

         ON CHANGE chk5
#表示改成了Y，要先检查一下是否5个单身有别的Y，有的话，报错退出，没有的话，产生报工咨讯页签资料，并光标定位到工时栏位
            IF g_srac5_d[l_ac5].chk5 ='Y' THEN 
               CALL asrp330_set_srac_detail_n()
               LET g_srac5_d[l_ac5].chk5 ='Y'
               CALL asrp330_gen_sffb_m1('5',g_srac5_d[l_ac5].*)
               #LET g_sffb001 = '5'   #161228-00028#2
               LET g_sffb001 = '15'   #161228-00028#2
               LET g_srac.*  = g_srac5_d[l_ac5].*
#是否要show一次？不确定，看dialog是unbuffer的，应该不用了吧
               NEXT FIELD sffb014_1
            ELSE
#清空报工咨讯页签等 
               IF asrp330_chk_count() = 0 THEN
                  LET g_sffb001 = NULL
                  INITIALIZE g_srac.* TO NULL
                  INITIALIZE g_sffb_m1.* TO NULL
                  CALL g_sffd_d.clear()
                  CALL g_sffc_d.clear()
               END IF
            END IF

         AFTER ROW
            IF g_srac5_d[l_ac5].chk5 ='Y' THEN
               NEXT FIELD sffb014_1
            END IF

         ON ACTION controlo
            CALL FGL_SET_ARR_CURR(g_srac5_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac5
            LET li_reproduce_target = g_srac5_d.getLength()+1
			
      END INPUT

      INPUT ARRAY g_sffd_d FROM s_detail6.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sffd_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            LET g_rec_b = g_sffd_d.getLength()
            #add-point:資料輸入前
            CALL cl_set_act_visible("accept,cancel",FALSE)

            #end add-point
         
         BEFORE ROW
            LET l_cmd = ''
            LET l_ac6 = ARR_CURR()
            LET g_detail_idx = l_ac6
            
            LET l_n = ARR_COUNT()
            DISPLAY l_ac6 TO FORMONLY.idx
                     
            LET g_rec_b = g_sffd_d.getLength()
            
            IF g_rec_b >= l_ac6 
               AND g_sffd_d[l_ac6].sffdseq1 IS NOT NULL
               AND g_sffd_d[l_ac6].sffd001 IS NOT NULL
 
 
            THEN
               LET l_cmd='u'
               LET g_sffd_d_t.* = g_sffd_d[l_ac6].*  #BACKUP
            ELSE
               LET l_cmd='a'
            END IF
        
         BEFORE INSERT
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sffd_d[l_ac6].* TO NULL 
            
            LET g_sffd_d_t.* = g_sffd_d[l_ac6].*     #新輸入資料
            CALL cl_show_fld_cont()
  
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
            ERROR 'INSERT O.K'
            LET g_rec_b = g_rec_b + 1              

         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' AND g_sffd_d.getLength() < l_ac6 THEN
               CALL FGL_SET_ARR_CURR(l_ac6-1)
               CALL g_sffd_d.deleteElement(l_ac6)
               NEXT FIELD sffdseq1
            END IF
            IF NOT cl_ask_del_detail() THEN
               CANCEL DELETE
            END IF
            LET g_rec_b = g_rec_b-1  
            
         AFTER DELETE 

         AFTER FIELD sffdseq1
            IF NOT cl_ap_chk_Range(g_sffd_d[l_ac6].sffdseq1,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sffdseq1
            END IF
             
         #此段落由子樣板a01產生
         BEFORE FIELD sffdseq1
            IF g_sffd_d[l_ac6].sffdseq1 = 0 OR g_sffd_d[l_ac6].sffdseq1 IS NULL THEN
               LET g_sffd_d[l_ac6].sffdseq1 = g_sffd_d.getLength() 
            END IF               
       
         ON CHANGE sffdseq1

         AFTER FIELD sffd001
            
            #add-point:AFTER FIELD sffd001
            IF NOT cl_null(g_sffd_d[l_ac6].sffd001) THEN 
               INITIALIZE g_chkparam.* TO NULL               
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sffd_d[l_ac6].sffd001
               LET g_chkparam.err_str[1] = "aqc-00032:sub-01302|aqci030|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
               LET g_chkparam.err_str[2] = "aqc-00031:sub-01303|aqci030|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_oocq002_1053") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 

               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sffd_d[l_ac6].sffd001
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='1053' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sffd_d[l_ac6].sffd001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sffd_d[l_ac6].sffd001_desc


            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffd001
            #add-point:BEFORE FIELD sffd001

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffd001
            #add-point:ON CHANGE sffd001

            #END add-point
 
         #----<<sffd002>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffd002
            #此段落由子樣板a15產生
            IF NOT cl_ap_chk_Range(g_sffd_d[l_ac6].sffd002,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sffd002
            END IF
 
 
            #add-point:AFTER FIELD sffd002
            IF NOT cl_null(g_sffd_d[l_ac6].sffd002) THEN 
            END IF 

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffd002
            #add-point:BEFORE FIELD sffd002

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffd002
            #add-point:ON CHANGE sffd002

            #END add-point
 
         #----<<sffd003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sffd003
            #add-point:BEFORE FIELD sffd003

            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sffd003
            
            #add-point:AFTER FIELD sffd003

            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sffd003
            #add-point:ON CHANGE sffd003

            #END add-point
 
 
         #---------------------<  Detail: page1  >---------------------
         #----<<sffdseq1>>----
         #Ctrlp:input.c.page1.sffdseq1
         ON ACTION controlp INFIELD sffdseq1
            #add-point:ON ACTION controlp INFIELD sffdseq1

            #END add-point
 
         #----<<sffd001>>----
         #Ctrlp:input.c.page1.sffd001
         ON ACTION controlp INFIELD sffd001
            #add-point:ON ACTION controlp INFIELD sffd001
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffd_d[l_ac6].sffd001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "1053" #

            CALL q_oocq002()                                #呼叫開窗

            LET g_sffd_d[l_ac6].sffd001 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sffd_d[l_ac6].sffd001 TO sffd001              #顯示到畫面上

            NEXT FIELD sffd001                          #返回原欄位


            #END add-point
 
         #----<<sffd002>>----
         #Ctrlp:input.c.page1.sffd002
         ON ACTION controlp INFIELD sffd002
            #add-point:ON ACTION controlp INFIELD sffd002

            #END add-point
 
         #----<<sffd003>>----
         #Ctrlp:input.c.page1.sffd003
         ON ACTION controlp INFIELD sffd003
            #add-point:ON ACTION controlp INFIELD sffd003

            #END add-point
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_sffd_d[l_ac6].* = g_sffd_d_t.*
               EXIT DIALOG 
            END IF
              
            
         AFTER ROW

              
         AFTER INPUT

 
         ON ACTION controlo    
            CALL FGL_SET_ARR_CURR(g_sffd_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac6
            LET li_reproduce_target = g_sffd_d.getLength()+1
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      
      
      INPUT ARRAY g_sffc_d FROM s_detail7.*
         ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 

                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
#只有check in和check out可以录入
           #IF g_sffb_m1.sffb001 NOT MATCHES '[24]' THEN    #161228-00028#2
           IF g_sffb_m1.sffb001 <>'12' OR g_sffb_m1.sffb001 <>'14' THEN     #161228-00028#2
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00288'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD sffb014_1
            END IF
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sffc_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF  
           LET g_rec_b = g_sffc_d.getLength()
           CALL cl_set_act_visible("accept,cancel",FALSE)

            
         BEFORE INSERT
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sffc_d[l_ac7].* TO NULL 
            LET g_sffc_d[l_ac7].sffc006 ='N'
            LET g_sffc_d_t.* = g_sffc_d[l_ac7].*     #新輸入資料           
            CALL cl_show_fld_cont()  
            
         BEFORE ROW     
            LET l_cmd = ''
            LET l_ac7 = ARR_CURR()
            LET g_detail_idx = l_ac7
              
            LET l_n = ARR_COUNT()
            DISPLAY l_ac7 TO FORMONLY.idx
     
            
            LET g_rec_b = g_sffc_d.getLength()
            
            IF g_rec_b >= l_ac7 
               AND g_sffc_d[l_ac7].sffc001 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_sffc_d_t.* = g_sffc_d[l_ac7].*  #BACKUP
            ELSE
               LET l_cmd='a'
            END IF

            
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' AND g_sffc_d.getLength() < l_ac7 THEN
               CALL FGL_SET_ARR_CURR(l_ac7-1)
               CALL g_sffc_d.deleteElement(l_ac7)
               NEXT FIELD sffc001
            END IF
         
            IF NOT cl_ask_del_detail() THEN
               CANCEL DELETE
            END IF
               
            LET g_rec_b = g_rec_b-1
            
         AFTER DELETE 

 
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
              
            ERROR 'INSERT O.K'
            LET g_rec_b = g_rec_b + 1
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_sffc_d[l_ac7].* = g_sffc_d_t.*
               EXIT DIALOG 
            END IF

         AFTER FIELD sffc001
            IF NOT cl_null(g_sffc_d[l_ac7].sffc001)  THEN 
               #是否存在编号
               IF NOT s_azzi650_chk_exist('223',g_sffc_d[l_ac7].sffc001) THEN
                  LET g_sffc_d[l_ac7].sffc001 = g_sffc_d_t.sffc001                    
                  NEXT FIELD sffc001
               END IF 
            END IF
            INITIALIZE g_chkparam.* TO NULL
            LET g_chkparam.arg1 = '223'
            LET g_chkparam.arg2 = g_sffc_d[l_ac7].sffc001
            CALL cl_ref_val("v_oocql002")
            LET g_sffc_d[l_ac7].sffc001_desc = g_chkparam.return1
            DISPLAY BY NAME g_sffc_d[l_ac7].sffc001_desc 
        
         AFTER FIELD sffc002
            IF NOT cl_null(g_sffc_d[l_ac7].sffc002)  THEN 
               IF g_sffc_d[l_ac7].sffc002 = '1' THEN
                  CALL cl_set_comp_entry('sffc003,sffc004',TRUE)
               ELSE
                  LET g_sffc_d[l_ac7].sffc003 = ''
                  LET g_sffc_d[l_ac7].sffc004 = ''
                  CALL cl_set_comp_entry('sffc003,sffc004',FALSE)
               END IF
            END IF
 
         AFTER FIELD sffc003
            IF NOT cl_null(g_sffc_d[l_ac7].sffc003) AND NOT cl_null(g_sffc_d[l_ac7].sffc004) THEN
               IF g_sffc_d[l_ac7].sffc003 > g_sffc_d[l_ac7].sffc004 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aim-00142'
                  LET g_errparam.extend = g_sffc_d[l_ac7].sffc003
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sffc_d[l_ac7].sffc003 = g_sffc_d_t.sffc003
                  NEXT FIELD sffc003
               END IF
            END IF   

         AFTER FIELD sffc004
            IF NOT cl_null(g_sffc_d[l_ac7].sffc003) AND NOT cl_null(g_sffc_d[l_ac7].sffc004) THEN
               IF g_sffc_d[l_ac7].sffc003 > g_sffc_d[l_ac7].sffc004 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aim-00142'
                  LET g_errparam.extend = g_sffc_d[l_ac7].sffc003
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sffc_d[l_ac7].sffc004 = g_sffc_d_t.sffc004
                  NEXT FIELD sffc004
               END IF
            END IF 
         #----<<sffc005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sffc005
            #add-point:BEFORE FIELD sffc005

            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sffc005
            
            #add-point:AFTER FIELD sffc005
            IF g_sffc_d[l_ac7].sffc005 IS NULL AND g_sffc_d[l_ac7].sffc006 = 'Y' THEN
               NEXT FIELD sffc005
            END IF
            IF g_sffc_d[l_ac7].sffc002 = '1' AND NOT cl_null(g_sffc_d[l_ac7].sffc003) THEN
               IF NOT s_chr_alphanumeric(g_sffc_d[l_ac7].sffc005,1) THEN
                  LET g_sffc_d[l_ac7].sffc005 = g_sffc_d_t.sffc005
                  NEXT FIELD sffc005
               END IF
               IF NOT cl_null(g_sffc_d[l_ac7].sffc003) THEN
                  IF g_sffc_d[l_ac7].sffc005 < g_sffc_d[l_ac7].sffc003 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00195'
                     LET g_errparam.extend = g_sffc_d[l_ac7].sffc005
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_sffc_d[l_ac7].sffc005 = g_sffc_d_t.sffc005
                     NEXT FIELD sffc005
                  END IF
               END IF
               IF NOT cl_null(g_sffc_d[l_ac7].sffc004) THEN
                  IF g_sffc_d[l_ac7].sffc005 > g_sffc_d[l_ac7].sffc004 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00195'
                     LET g_errparam.extend = g_sffc_d[l_ac7].sffc005
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_sffc_d[l_ac7].sffc005 = g_sffc_d_t.sffc005
                     NEXT FIELD sffc005
                  END IF
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sffc005
            #add-point:ON CHANGE sffc005

            #END add-point
 
 
         #---------------------<  Detail: page2  >---------------------
         #----<<sffc005>>----
         #Ctrlp:input.c.page2.sffc005
         ON ACTION controlp INFIELD sffc005
            #add-point:ON ACTION controlp INFIELD sffc005
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sffc_d[l_ac7].sffc001
            LET g_qryparam.arg1 = "223"
            CALL q_oocq002()
            LET g_sffc_d[l_ac7].sffc001 = g_qryparam.return1 
            DISPLAY g_sffc_d[l_ac7].sffc001 TO sffc001
            NEXT FIELD sffc001 
            #END add-point

         ON ACTION controlp INFIELD sffc001
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sffc_d[l_ac].sffc001             #給予default值
            #給予arg
            LET g_qryparam.arg1 = "223" #
            CALL q_oocq002()                                             #呼叫開窗
            LET g_sffc_d[l_ac].sffc001 = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_sffc_d[l_ac].sffc001 TO sffc001                    #顯示到畫面上
            INITIALIZE g_chkparam.* TO NULL
            LET g_chkparam.arg1 = '223'
            CALL cl_ref_val("v_oocql002")
            LET g_sffc_d[l_ac].sffc001_desc = g_chkparam.return1
            DISPLAY BY NAME g_sffc_d[l_ac].sffc001_desc
 
 
         AFTER ROW
            #add-point:單身page2 after_row

            #end add-point
            LET l_ac7 = ARR_CURR()
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sffc_d[l_ac7].* = g_sffc_d_t.*
               END IF
               EXIT DIALOG 
            END IF
            

 
         AFTER INPUT
            #add-point:input段after input 

            #end add-point   
    
         ON ACTION controlo
            CALL FGL_SET_ARR_CURR(g_sffc_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac7
            LET li_reproduce_target = g_sffc_d.getLength()+1
 
      END INPUT
 
 
      #报工咨讯页签
      INPUT g_sffb_m1.sffb001,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,
            g_sffb_m1.sffb008,g_sffb_m1.sffb012,g_sffb_m1.sffb013,g_sffb_m1.sffb014,g_sffb_m1.sffb015,
            g_sffb_m1.qty,g_sffb_m1.sffb016,g_sffb_m1.sffb017,g_sffb_m1.sffb018,g_sffb_m1.sffb019,g_sffb_m1.sffb020,
            g_sffb_m1.sffb021,g_sffb_m1.sffb022
      FROM sffb001_1,sffb026_1,sffb027_1,sffb028_1,sffb007_1,sffb008_1,sffb012_1,sffb013_1,sffb014_1,sffb015_1,qty,
           sffb016_1,sffb017_1,sffb018_1,sffb019_1,sffb020_1,sffb021_1,sffb022_1
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT

            #add-point:資料輸入前
            CALL asrp330_set_sffb013_format()
            #计算器的全局变量清空
            LET g_calc_field = NULL
            LET g_calc_amt   = NULL 
            #控制key欄位可否輸入
            CALL asrp330_set_entry(p_cmd)
            CALL asrp330_set_no_entry(p_cmd) 
            INITIALIZE g_sffb_m1_t.* TO NULL
            LET p_cmd = 'a'
            IF g_sffb_m1.sffb026 IS NOT NULL THEN  
               LET p_cmd = 'u' 
               LET g_sffb_m1_t.* = g_sffb_m1.*
            END IF  
            CALL cl_set_act_visible("accept,cancel",FALSE)           
            #end add-point

          #----<<sffb026>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb026_1
            #此段落由子樣板a15產生
          
            #add-point:AFTER FIELD sffb026

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb026_1
            #add-point:BEFORE FIELD sffb026
          
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb026_1
            #add-point:ON CHANGE sffb026

            #END add-point
            
         #----<<sffb027>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb027_1
            #此段落由子樣板a15產生
          
            #add-point:AFTER FIELD sffb027

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb027_1
            #add-point:BEFORE FIELD sffb027
          
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb027_1
            #add-point:ON CHANGE sffb027

            #END add-point
         
         #----<<sffb028>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb028_1
            #此段落由子樣板a15產生
          
            #add-point:AFTER FIELD sffb028

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb028_1
            #add-point:BEFORE FIELD sffb028
          
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb028_1
            #add-point:ON CHANGE sffb028

            #END add-point
            
         #----<<sffb001>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb001_1
            #此段落由子樣板a15產生
            #161228-00028#2
            #IF NOT cl_ap_chk_Range(g_sffb_m1.sffb001,"1.000","1","5.000","1","azz-00087",1) THEN #161228-00028#2
            IF NOT cl_ap_chk_Range(g_sffb_m1.sffb001,"11.000","1","15.000","1","azz-00087",1) THEN #161228-00028#2
               NEXT FIELD sffb001_1
            END IF
 
 
            #add-point:AFTER FIELD sffb001
            IF NOT cl_null(g_sffb_m1.sffb001) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m1_t.sffb001 IS NULL OR g_sffb_m1.sffb001 <> g_sffb_m1_t.sffb001)) THEN
                  IF NOT s_asrt335_chk_sffb(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008) THEN
                     LET g_sffb_m1.sffb001 = g_sffb_m1_t.sffb001
                     NEXT FIELD CURRENT
                  END IF                  
               END IF
               
            END IF 
            CALL asrp330_set_no_entry(p_cmd)
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb001_1
            #add-point:BEFORE FIELD sffb001
            CALL asrp330_set_entry(p_cmd)
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb001_1
            #add-point:ON CHANGE sffb001

            #END add-point

 
         #----<<sffb007>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb007_1
            
            #add-point:AFTER FIELD sffb007
#单独列出sffb007，sffb008的联动检查和预设待处理数量
            IF NOT cl_null(g_sffb_m1.sffb007) AND NOT cl_null(g_sffb_m1.sffb008) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m1.sffb007 != g_sffb_m1_t.sffb007 OR g_sffb_m1.sffb008 != g_sffb_m1_t.sffb008)) THEN 
#共用检查逻辑搬到同一个function内
                
                  IF NOT s_asrt335_chk_sffb(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008) THEN
                     NEXT FIELD CURRENT
                  END IF
                  CALL s_asrt335_default_sffb(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008)
                  RETURNING g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,l_sffb009

                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sffb_m1.sffb007
                  CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
                  LET g_sffb_m1.sffb007_desc = '', g_rtn_fields[1] , ''
               END IF
#预设待处理数量，只要判断当前栏位有变化或者是新增即可，不用担心其他相关栏位是否为空，因为子程序里已经做了判断
               CALL s_asrt335_set_qty(g_sffb_m.sffbdocno,'',g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008) 
               RETURNING g_sffb_m1.qty,g_sffb_m1.sffb016
               DISPLAY BY NAME g_sffb_m1.qty,g_sffb_m1.sffb016               

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sffb_m1.sffb007
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sffb_m1.sffb007_desc = '', g_rtn_fields[1] , ''
            DISPLAY g_sffb_m1.sffb007_desc TO sffb007_1_desc
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb007_1
            #add-point:BEFORE FIELD sffb007

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb007_1
            #add-point:ON CHANGE sffb007

            #END add-point
 
         #----<<sffb008>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb008_1
            
            #add-point:AFTER FIELD sffb008
#这里有漏洞，必须加一层判断新增或者更改成不等于旧值时，且作业编号与制程序的检查是联动一起的
            IF NOT cl_null(g_sffb_m1.sffb007) AND NOT cl_null(g_sffb_m1.sffb008) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m1.sffb007 != g_sffb_m1_t.sffb007 OR g_sffb_m1.sffb008 != g_sffb_m1_t.sffb008)) THEN 
#共用检查逻辑搬到同一个function内
                  IF NOT s_asrt335_chk_sffb(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008) THEN
                     NEXT FIELD CURRENT
                  END IF 
 #预设待处理数量，只要判断当前栏位有变化或者是新增即可，不用担心其他相关栏位是否为空，因为子程序里已经做了判断
                  
                  CALL s_asrt335_set_qty('','',g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008)
                  RETURNING g_sffb_m1.qty,g_sffb_m1.sffb016
                  DISPLAY BY NAME g_sffb_m1.qty,g_sffb_m1.sffb016
                 
               END IF
            

            END IF
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb008_1
            #add-point:BEFORE FIELD sffb008

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb008_1
            #add-point:ON CHANGE sffb008

            #END add-point
 
         #----<<sffb012>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sffb012_1
            #add-point:BEFORE FIELD sffb012

            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sffb012_1
            
            #add-point:AFTER FIELD sffb012
            IF g_sffb_m1.sffb012 IS NOT NULL THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND g_sffb_m1.sffb012 != g_sffb_m1_t.sffb012) THEN 
                  IF NOT s_asrt335_check_time(g_sffb_m1.sffb012,g_sffb_m1.sffb013,g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008) THEN
                     LET g_sffb_m1.sffb012 = g_sffb_m1_t.sffb012
                     NEXT FIELD CURRENT
                  ELSE
                     LET g_sffb_m1.sffb014 = s_asrt335_get_working_time(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb012,g_sffb_m1.sffb013) * g_sffb_m.sffb011
                     LET g_sffb_m1.sffb015 = s_asrt335_get_working_time(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb012,g_sffb_m1.sffb013)
                  END IF
               END IF
            END IF
            #END add-point
       
         #此段落由子樣板a04產生
         ON CHANGE sffb012_1
            #add-point:ON CHANGE sffb012

            #END add-point
 
         #----<<sffb013>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sffb013_1
            #add-point:BEFORE FIELD sffb013

            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sffb013_1
            
            #add-point:AFTER FIELD sffb013
            IF g_sffb_m1.sffb013 IS NOT NULL THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND g_sffb_m1.sffb013 != g_sffb_m1_t.sffb013) THEN 
                  IF NOT s_asrt335_check_time(g_sffb_m1.sffb012,g_sffb_m1.sffb013,g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008) THEN
                     LET g_sffb_m1.sffb013 = g_sffb_m1_t.sffb013 
                     NEXT FIELD CURRENT
                  ELSE
                     LET g_sffb_m1.sffb014 = s_asrt335_get_working_time(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb012,g_sffb_m1.sffb013) * g_sffb_m.sffb011
                     LET g_sffb_m1.sffb015 = s_asrt335_get_working_time(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb012,g_sffb_m1.sffb013)
                  END IF
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sffb013_1
            #add-point:ON CHANGE sffb013

            #END add-point
 
         #----<<sffb014>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sffb014_1
            #add-point:BEFORE FIELD sffb014
            LET g_calc_field = 'sffb014_1'
            LET g_calc_amt = NULL
            LET g_sffb_m1.sffb014 = asrp330_cut_zero(g_sffb_m1.sffb014)
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sffb014_1
            
            #add-point:AFTER FIELD sffb014
               #为配合计算器显示栏位定义成char型了，做数据运算前回归num20_6的格式
               LET l_sffb014 = g_sffb_m1.sffb014
               LET g_sffb_m1.sffb014 = l_sffb014
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sffb014_1
            #add-point:ON CHANGE sffb014

            #END add-point
 
         #----<<sffb015>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sffb015_1
            #add-point:BEFORE FIELD sffb015
            LET g_calc_field = 'sffb015_1'
            LET g_calc_amt = NULL
            LET g_sffb_m1.sffb015 = asrp330_cut_zero(g_sffb_m1.sffb015)
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sffb015_1
            
            #add-point:AFTER FIELD sffb015
               #为配合计算器显示栏位定义成char型了，做数据运算前回归num20_6的格式
               LET l_sffb015 = g_sffb_m1.sffb015
               LET g_sffb_m1.sffb015 = l_sffb015
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sffb015_1
            #add-point:ON CHANGE sffb015

            #END add-point
 
  
         #----<<sffb017>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb017_1
            #此段落由子樣板a15產生
            IF NOT cl_ap_chk_Range(g_sffb_m1.sffb017,"0.000","1","","","azz-00079",1) THEN
               NEXT FIELD sffb017_1
            END IF
 
            
            #add-point:AFTER FIELD sffb017
            IF NOT cl_null(g_sffb_m1.sffb017) THEN 
               #为配合计算器显示栏位定义成char型了，做数据运算前回归num20_6的格式
               LET l_sffb017 = g_sffb_m1.sffb017
               LET g_sffb_m1.sffb017 = l_sffb017
               IF p_cmd = 'a' OR (p_cmd = 'u' AND g_sffb_m1.sffb017 != g_sffb_m1_t.sffb017 ) THEN
                  IF NOT s_asrt335_chk_qty(g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb017,g_sffb_m1.sffb018,g_sffb_m1.sffb019,g_sffb_m1.sffb020,g_sffb_m1.qty) THEN
                     LET g_sffb_m1.sffb017 = g_sffb_m1_t.sffb017
                     NEXT FIELD sffb017_1
                  END IF
               END IF
            END IF 

            #END add-point
            
         #此段落由子樣板a01產生
         BEFORE FIELD sffb017_1
            #add-point:BEFORE FIELD sffb017
            LET g_calc_field = 'sffb017_1'
            LET g_calc_amt = NULL
            LET g_sffb_m1.sffb017 = asrp330_cut_zero(g_sffb_m1.sffb017)
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb017_1
            #add-point:ON CHANGE sffb017

            #END add-point
 
         #----<<sffb018>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb018_1
            #此段落由子樣板a15產生
            IF NOT cl_ap_chk_Range(g_sffb_m1.sffb018,"0.000","1","","","azz-00079",1) THEN
               NEXT FIELD sffb018_1
            END IF
 
 
            #add-point:AFTER FIELD sffb018
            IF NOT cl_null(g_sffb_m1.sffb018) THEN 
               #为配合计算器显示栏位定义成char型了，做数据运算前回归num20_6的格式
               LET l_sffb018 = g_sffb_m1.sffb018
               LET g_sffb_m1.sffb018 = l_sffb018
               IF p_cmd = 'a' OR (p_cmd = 'u' AND g_sffb_m1.sffb018 != g_sffb_m1_t.sffb018 ) THEN 
                  IF NOT s_asrt335_chk_qty(g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb017,g_sffb_m1.sffb018,g_sffb_m1.sffb019,g_sffb_m1.sffb020,g_sffb_m1.qty) THEN                    
                     LET g_sffb_m1.sffb018 = g_sffb_m1_t.sffb018
                     NEXT FIELD sffb018_1
                  END IF
               END IF
            END IF 

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb018_1
            #add-point:BEFORE FIELD sffb018
            LET g_calc_field = 'sffb018_1'
            LET g_calc_amt = NULL
            LET g_sffb_m1.sffb018 = asrp330_cut_zero(g_sffb_m1.sffb018)
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb018_1
            #add-point:ON CHANGE sffb018

            #END add-point
 
         #----<<sffb019>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb019_1
            #此段落由子樣板a15產生
            IF NOT cl_ap_chk_Range(g_sffb_m1.sffb019,"0.000","1","","","azz-00079",1) THEN
               NEXT FIELD sffb019_1
            END IF
 
 
            #add-point:AFTER FIELD sffb019
            IF NOT cl_null(g_sffb_m1.sffb019) THEN
               #为配合计算器显示栏位定义成char型了，做数据运算前回归num20_6的格式
               LET l_sffb019 = g_sffb_m1.sffb019
               LET g_sffb_m1.sffb019 = l_sffb019
               IF p_cmd = 'a' OR (p_cmd = 'u' AND g_sffb_m1.sffb019 != g_sffb_m1_t.sffb019 ) THEN
                  IF NOT s_asrt335_chk_qty(g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb017,g_sffb_m1.sffb018,g_sffb_m1.sffb019,g_sffb_m1.sffb020,g_sffb_m1.qty) THEN
                     LET g_sffb_m1.sffb019 = g_sffb_m1_t.sffb019
                     NEXT FIELD sffb019_1
                  END IF
               END IF            
            END IF 

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb019_1
            #add-point:BEFORE FIELD sffb019
            LET g_calc_field = 'sffb019_1'
            LET g_calc_amt = NULL
            LET g_sffb_m1.sffb019 = asrp330_cut_zero(g_sffb_m1.sffb019)
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb019_1
            #add-point:ON CHANGE sffb019

            #END add-point
 
         #----<<sffb020>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb020_1
            #此段落由子樣板a15產生
            IF NOT cl_ap_chk_Range(g_sffb_m1.sffb020,"0.000","1","","","azz-00079",1) THEN
               NEXT FIELD sffb020_1
            END IF
 
 
            #add-point:AFTER FIELD sffb020
            IF NOT cl_null(g_sffb_m1.sffb020) THEN 
               #为配合计算器显示栏位定义成char型了，做数据运算前回归num20_6的格式
               LET l_sffb020 = g_sffb_m1.sffb020
               LET g_sffb_m1.sffb020 = l_sffb020
               IF p_cmd = 'a' OR (p_cmd = 'u' AND g_sffb_m1.sffb020 != g_sffb_m1_t.sffb020) THEN
                  IF NOT s_asrt335_chk_qty(g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb017,g_sffb_m1.sffb018,g_sffb_m1.sffb019,g_sffb_m1.sffb020,g_sffb_m1.qty) THEN
                     LET g_sffb_m1.sffb020 = g_sffb_m1_t.sffb020
                     NEXT FIELD sffb020_1
                  END IF
               END IF
               IF g_sffb_m1.sffb020 > 0 THEN
                  CALL cl_set_comp_entry("sffb021", TRUE)
                  CALL cl_set_comp_entry("sffb022", TRUE)
               ELSE
                  CALL cl_set_comp_entry("sffb021", FALSE)
                  CALL cl_set_comp_entry("sffb022", FALSE)
               END IF
            END IF 
            
         
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb020_1
            #add-point:BEFORE FIELD sffb020
            LET g_calc_field = 'sffb020_1'
            LET g_calc_amt = NULL
            LET g_sffb_m1.sffb020 = asrp330_cut_zero(g_sffb_m1.sffb020) 
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb020_1
            #add-point:ON CHANGE sffb020

            #END add-point
            
         #----<<sffb021>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb021_1
            #此段落由子樣板a15產生
          
            #add-point:AFTER FIELD sffb021
            IF NOT cl_null(g_sffb_m1.sffb021) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m1_t.sffb021 IS NULL OR g_sffb_m1.sffb021 != g_sffb_m1_t.sffb021)) THEN
                     #共用检查逻辑搬到同一个function内
                     IF NOT s_asrt335_chk_sffb(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb021,g_sffb_m1.sffb022) THEN
                        LET g_sffb_m1.sffb021 = g_sffb_m1_t.sffb021
                        NEXT FIELD CURRENT
                     END IF
                      
                     IF g_sffb_m1.sffb021 = g_sffb_m1.sffb007 THEN
                        NEXT FIELD CURRENT
                     END IF
                   
                END IF
             END IF
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb021_1
            #add-point:BEFORE FIELD sffb021
            IF g_sffb_m1.sffb020 > 0 THEN
                  CALL cl_set_comp_entry("sffb021_1", TRUE)
                  CALL cl_set_comp_entry("sffb022_1", TRUE)
            ELSE
                  CALL cl_set_comp_entry("sffb021_1", FALSE)
                  CALL cl_set_comp_entry("sffb022_1", FALSE)
            END IF
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb021_1
            #add-point:ON CHANGE sffb021

            #END add-point
         
         #----<<sffb022>>----
         #此段落由子樣板a02產生
         AFTER FIELD sffb022_1
            #此段落由子樣板a15產生
          
            #add-point:AFTER FIELD sffb022
            IF NOT cl_null(g_sffb_m1.sffb022) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sffb_m1_t.sffb022 IS NULL OR g_sffb_m1.sffb022 != g_sffb_m1_t.sffb022)) THEN
                     #共用检查逻辑搬到同一个function内
                     IF NOT s_asrt335_chk_sffb(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb021,g_sffb_m1.sffb022) THEN
                        LET g_sffb_m1.sffb022 = g_sffb_m1_t.sffb022
                        NEXT FIELD CURRENT
                     END IF
                      
                     IF g_sffb_m1.sffb022 = g_sffb_m1.sffb008 THEN
                        NEXT FIELD CURRENT
                     END IF
                   
                END IF
             END IF
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sffb022_1
            #add-point:BEFORE FIELD sffb022
            IF g_sffb_m1.sffb020 > 0 THEN
                  CALL cl_set_comp_entry("sffb021_1", TRUE)
                  CALL cl_set_comp_entry("sffb022_1", TRUE)
            ELSE
                  CALL cl_set_comp_entry("sffb021_1", FALSE)
                  CALL cl_set_comp_entry("sffb022_1", FALSE)
            END IF
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sffb022_1
            #add-point:ON CHANGE sffb022

            #END add-point
        
 #欄位檢查
         #---------------------------<  Master  >---------------------------

         #----<<sffb007>>----
         #Ctrlp:input.c.sffb007
         ON ACTION controlp INFIELD sffb007_1
            #add-point:ON ACTION controlp INFIELD sffb007
#此段落由子樣板a07產生            
            #開窗i段
			      INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			      LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m1.sffb007               #給予default值
            LET g_qryparam.default2 = g_sffb_m1.sffb008               #製程序

            CALL q_srac008()
            LET g_sffb_m1.sffb007 = g_qryparam.return1                 #將開窗取得的值回傳到變數
            LET g_sffb_m1.sffb008 = g_qryparam.return2                 #製程序

            DISPLAY g_sffb_m1.sffb007 TO sffb007_1                     #顯示到畫面上
#            DISPLAY g_sffb_m1.sffb007_desc TO sffb007_1_desc           #说明
            DISPLAY g_sffb_m1.sffb008 TO sffb008_1                     #製程序

            NEXT FIELD sffb007_1                                      #返回原欄位

            #END add-point
 
         #----<<sffb008>>----
         #Ctrlp:input.c.sffb008
         ON ACTION controlp INFIELD sffb008_1
            #add-point:ON ACTION controlp INFIELD sffb008
#此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m1.sffb007             #給予default值
            LET g_qryparam.default2 = g_sffb_m1.sffb008             #製程序

            CALL q_srac008()

            LET g_sffb_m1.sffb007 = g_qryparam.return1                 #將開窗取得的值回傳到變數
            LET g_sffb_m1.sffb008 = g_qryparam.return2                 #製程序

            DISPLAY g_sffb_m1.sffb007 TO sffb007_1                     #顯示到畫面上
            DISPLAY g_sffb_m1.sffb008 TO sffb008_1                     #製程序

            NEXT FIELD sffb008_1                          #返回原欄位
         
         #----<<sffb021>>----
         #Ctrlp:input.c.sffb021
         ON ACTION controlp INFIELD sffb021_1
            #add-point:ON ACTION controlp INFIELD sffb021
            #此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m1.sffb021               #給予default值
            LET g_qryparam.default2 = g_sffb_m1.sffb022               #製程序

            CALL q_srac008_3()
            LET g_sffb_m1.sffb021 = g_qryparam.return1                 #將開窗取得的值回傳到變數
            LET g_sffb_m1.sffb021_desc = g_qryparam.return2            #说明
            LET g_sffb_m1.sffb022 = g_qryparam.return3                 #製程序

            DISPLAY g_sffb_m1.sffb021 TO sffb021_1                     #顯示到畫面上
            DISPLAY g_sffb_m1.sffb021_desc TO sffb021_1_desc           #说明
            DISPLAY g_sffb_m1.sffb022 TO sffb022_1                     #製程序

            NEXT FIELD sffb021_1                                      #返回原欄位

            #END add-point
         
         #----<<sffb022>>----
         #Ctrlp:input.c.sffb022
         ON ACTION controlp INFIELD sffb022_1
            #add-point:ON ACTION controlp INFIELD sffb022
            #此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m1.sffb021               #給予default值
            LET g_qryparam.default2 = g_sffb_m1.sffb022               #製程序

            CALL q_srac008_3()
            LET g_sffb_m1.sffb021 = g_qryparam.return1                 #將開窗取得的值回傳到變數
            LET g_sffb_m1.sffb021_desc = g_qryparam.return2            #说明
            LET g_sffb_m1.sffb022 = g_qryparam.return3                 #製程序

            DISPLAY g_sffb_m1.sffb021 TO sffb021_1                     #顯示到畫面上
            DISPLAY g_sffb_m1.sffb021_desc TO sffb021_1_desc           #说明
            DISPLAY g_sffb_m1.sffb022 TO sffb022_1                     #製程序

            NEXT FIELD sffb021_1                                      #返回原欄位

            #END add-point
            
         #----<<sffb026>>----
         #Ctrlp:input.c.sffb026
         ON ACTION controlp INFIELD sffb026
            #add-point:ON ACTION controlp INFIELD sffb026
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sffb_m1.sffb026             #給予default值
            LET g_qryparam.default2 = "" #g_sffb_m.bmaa002 #特性

            CALL q_bmaa001_4()                                #呼叫開窗

            LET g_sffb_m1.sffb026 = g_qryparam.return1              
            LET g_sffb_m1.sffb026_desc = g_qryparam.return2
            LET g_sffb_m1.sffb026_desc_1 = g_qryparam.return3           
            DISPLAY g_sffb_m1.sffb026        TO sffb026_1              #
            DISPLAY g_sffb_m1.sffb026_desc   TO sffb026_1_desc    #品名
            DISPLAY g_sffb_m1.sffb026_desc_1 TO sffb026_1_desc_1  #规格
            NEXT FIELD sffb026_1                         #返回原欄位
            
            #END add-point
         #----<<sffb027>>----
         #Ctrlp:input.c.sffb027
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD sffb027_1
            #add-point:ON ACTION controlp INFIELD sffb027
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sffb_m1.sffb027             #給予default值
            #給予arg
            LET g_qryparam.arg1 = "" #s
            CALL q_srab005_1()                                #呼叫開窗
            LET g_sffb_m1.sffb027 = g_qryparam.return1              
            DISPLAY g_sffb_m1.sffb027 TO sffb027_1              #
            NEXT FIELD sffb027_1                          #返回原欄位

            #END add-point
         #----<<sffb028>>----
         #Ctrlp:input.c.sffb028
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD sffb028_1
            #add-point:ON ACTION controlp INFIELD sffb028
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sffb_m1.sffb028             #給予default值
            CALL q_srab006_1()                                #呼叫開窗
            LET g_sffb_m1.sffb028 = g_qryparam.return1              #产品特征
            DISPLAY g_sffb_m1.sffb028 TO sffb028_1              #顯示到畫面上
            NEXT FIELD sffb028_1                          #返回原欄位
            #END add-point

         #----<<sffbownid>>----
         #----<<sffbowndp>>----
         #----<<sffbcrtid>>----
         #----<<sffbcrtdp>>----
         #----<<sffbcrtdt>>----
         #----<<sffbmodid>>----
         #----<<sffbmoddt>>----
         #----<<sffbcnfid>>----
         #----<<sffbcnfdt>>----
         #----<<sffbpstid>>----
         #----<<sffbpstdt>>----
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            CALL cl_showmsg()      #錯誤訊息統整顯示 
            
            #add-point:單頭新增後
            #end add-point

      END INPUT      
 
      #add-point:input段input_array"
      
      #end add-point

      BEFORE DIALOG
         LET g_curr_diag = ui.DIALOG.getCurrent()
         IF g_master_idx > 0 THEN
            IF g_master_idx > g_srac_d.getLength() THEN
               LET g_master_idx = g_srac_d.getLength()
            END IF
            CALL DIALOG.setCurrentRow("s_detail1", g_master_idx)
            LET l_ac = g_master_idx
         END IF
         LET g_master_idx = l_ac
         #add-point:input段input_array"
         
         LET g_countdown = 0
         LET g_time1 = NULL
#         LET g_msg       = cl_getmsg_parm('asf-00127',g_dlang,60-g_countdown)
#         CALL cl_set_comp_att_text('refresh',g_msg)
         LET p_cmd ='a'
         #end add-point


                  

      ON ACTION about
         CALL cl_about()

      ON ACTION help
         CALL cl_help_prog_url()

      ON ACTION controlg
         CALL cl_cmdask()


      ON IDLE 1  
         IF g_time1 IS NULL THEN
            LET g_time1 = cl_get_current()
         END IF
#去掉“-”，“：”和空格，得到2个数字做大小比较，不要求得到准确的秒数差
         LET g_time2 = g_time1
         LET g_time2 = s_chr_minus(g_time2,'-',0)
         LET g_time2 = s_chr_minus(g_time2,':',0)
         LET g_time2 = s_chr_atrim(g_time2)
         LET l_hhmmss = g_time2.substring(9,10)*3600+g_time2.substring(11,12)*60+g_time2.substring(13,14)
         LET g_time2 = g_time2.substring(1,8),l_hhmmss
         LET g_time3 = cl_get_current()
         LET g_time3 = s_chr_minus(g_time3,'-',0)
         LET g_time3 = s_chr_minus(g_time3,':',0)
         LET g_time3 = s_chr_atrim(g_time3)
         LET l_hhmmss = g_time3.substring(9,10)*3600+g_time3.substring(11,12)*60+g_time3.substring(13,14)
         LET g_time3 = g_time3.substring(1,8),l_hhmmss
          
         #这个2是容许误差2秒，2秒内的误差都不会触发重计倒计时，这是因为服务器有时候会很卡、停顿，尤其是网络的延迟，这些都会造成误差，如果特别卡，可以适当放大秒数误差，但是会造成必须操作X秒以上才会触发重计的现象
         IF g_time3 - g_time2 < 2 THEN
            IF g_countdown = 60 THEN    #自动刷新设为60秒
               CALL asrp330_refresh()
               LET g_countdown = 0
            END IF
            LET g_time1 = cl_get_current()
            LET g_countdown = g_countdown + 1
         ELSE      
            LET g_countdown = 0
            LET g_time1 = cl_get_current()            
         END IF


      ON ACTION ins_sffb
         CALL asrp330_commit()

      ON ACTION accept
         IF g_sffb_m.sffb004 IS NOT NULL AND g_sffb_m.sffb010 IS NOT NULL AND g_sffb_m.sffb011 IS NOT NULL THEN
            CALL asrp330_refresh()
         END IF
         ACCEPT DIALOG

      ON ACTION cancel
         LET INT_FLAG = TRUE
         EXIT DIALOG

      ON ACTION exit
         LET INT_FLAG = TRUE
         EXIT DIALOG

      ON ACTION close
         LET INT_FLAG = TRUE
         EXIT DIALOG
         
      ON ACTION controlr
         CALL cl_show_req_fields()

      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode())
              RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)
         
      ON ACTION datarefresh
         IF g_sffb_m.sffb009 IS NOT NULL THEN
            CALL asrp330_refresh()
         END IF

      ON ACTION refresh
         IF g_sffb_m.sffb009 IS NOT NULL THEN
            CALL asrp330_refresh()
         END IF
#计算器用的按钮
      ON ACTION give_up    #放棄當前操作，回到剛查詢出左單身的狀態
         LET g_sffb001 = NULL
         INITIALIZE g_srac.* TO NULL
         INITIALIZE g_sffb_m1.* TO NULL
         CALL g_sffd_d.clear()
         CALL g_sffc_d.clear()
         CALL asrp330_refresh()

      ON ACTION double_zero
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('x')
         
      ON ACTION zero
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('0')
         
      ON ACTION one
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('1')
         
      ON ACTION two
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('2')
         
      ON ACTION three
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('3')
         
      ON ACTION four
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('4')
         
      ON ACTION five
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('5')
         
      ON ACTION six
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('6')
         
      ON ACTION seven
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('7')
         
      ON ACTION eight
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('8')
         
      ON ACTION nine
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('9')
         
      ON ACTION dot
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('.')
         
      ON ACTION del
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('d')
         
      ON ACTION ce
         CASE    #如果清空了栏位再按计算器，缓存也该清空
            WHEN INFIELD(sffb014_1)
              IF cl_null(GET_FLDBUF(sffb014_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb015_1)
              IF cl_null(GET_FLDBUF(sffb015_1)) THEN
                 LET g_calc_amt = NULL
              END IF     
            WHEN INFIELD(sffb017_1)
              IF cl_null(GET_FLDBUF(sffb017_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb018_1)
              IF cl_null(GET_FLDBUF(sffb018_1)) THEN
                 LET g_calc_amt = NULL
              END IF
            WHEN INFIELD(sffb019_1)
              IF cl_null(GET_FLDBUF(sffb019_1)) THEN
                 LET g_calc_amt = NULL
              END IF      
            WHEN INFIELD(sffb020_1)
              IF cl_null(GET_FLDBUF(sffb020_1)) THEN
                 LET g_calc_amt = NULL
              END IF  
            OTHERWISE 
         END CASE
         CALL asrp330_calculator('c')
         
      ON ACTION enter
      CASE 
         WHEN INFIELD(sffb001_1)
           NEXT FIELD sffb005_1
         WHEN INFIELD(sffb005_1)
           NEXT FIELD sffb006_1
         WHEN INFIELD(sffb006_1)
           NEXT FIELD sffb007_1
         WHEN INFIELD(sffb007_1)
           NEXT FIELD sffb008_1
         WHEN INFIELD(sffb008_1)
           NEXT FIELD sffb012_1
         WHEN INFIELD(sffb012_1)
           NEXT FIELD sffb013_1
         WHEN INFIELD(sffb013_1)
           LET g_calc_amt = NULL
           LET g_calc_field = 'sffb014_1'
           NEXT FIELD sffb014_1
         WHEN INFIELD(sffb014_1)
           LET g_calc_amt = NULL
           LET g_calc_field = 'sffb015_1'
           NEXT FIELD sffb015_1
         WHEN INFIELD(sffb015_1)
           LET g_calc_amt = NULL
           LET g_calc_field = 'sffb017_1'
           NEXT FIELD sffb017_1      
         WHEN INFIELD(sffb017_1)
           LET g_calc_amt = NULL         
           LET g_calc_field = 'sffb018_1'
           NEXT FIELD sffb018_1
         WHEN INFIELD(sffb018_1)
           LET g_calc_amt = NULL         
           LET g_calc_field = 'sffb019_1'
           NEXT FIELD sffb019_1
         WHEN INFIELD(sffb019_1)
           LET g_calc_amt = NULL
           LET g_calc_field = 'sffb020_1'
           NEXT FIELD sffb020_1      
         WHEN INFIELD(sffb020_1)
           EXIT CASE      
         OTHERWISE 
      END CASE
      END DIALOG
      IF INT_FLAG THEN
         LET INT_FLAG = FALSE
         EXIT WHILE
      END IF
   END WHILE
END FUNCTION

PRIVATE FUNCTION asrp330_b1_fill(p_wc2)
   {<Local define>}
   DEFINE p_wc2           STRING
   DEFINE l_sffb016       LIKE type_t.num5
   {</Local define>}

   LET g_sql = "SELECT  UNIQUE 'N',srac004,srac030,'','',srac005,srac006,srac008,'',srac009 FROM srac_t",
               " WHERE sracent=? AND sracsite=?  AND ", p_wc2

   LET g_sql = g_sql, " ORDER BY srac_t.srac004 "

   PREPARE asrp330_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR asrp330_pb

   OPEN b_fill_curs USING g_enterprise,g_site

   CALL g_srac_d.clear()

   LET g_cnt = l_ac
   LET l_ac = 1
   ERROR "Searching!"

   FOREACH b_fill_curs INTO g_srac_d[l_ac].chk1,g_srac_d[l_ac].srac004_1,g_srac_d[l_ac].srac030,g_srac_d[l_ac].srac004_1_desc,
       g_srac_d[l_ac].srac004_1_desc_1,g_srac_d[l_ac].srac005,g_srac_d[l_ac].srac006,g_srac_d[l_ac].srac008_1,
       g_srac_d[l_ac].srac008_1_desc,g_srac_d[l_ac].srac009
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
#待处理数量要扣除未审核的其他报工单数量，小于等于0的排除掉
      #CALL s_asrt335_set_qty('','','1',g_sffb_m.sffb025,g_srac_d[l_ac].srac004_1,g_srac_d[l_ac].srac005,g_srac_d[l_ac].srac006,g_srac_d[l_ac].srac008_1,g_srac_d[l_ac].srac009)       #161228-00028#2 mark
      CALL s_asrt335_set_qty('','','11',g_sffb_m.sffb025,g_srac_d[l_ac].srac004_1,g_srac_d[l_ac].srac005,g_srac_d[l_ac].srac006,g_srac_d[l_ac].srac008_1,g_srac_d[l_ac].srac009)       #161228-00028#2 add
      RETURNING g_srac_d[l_ac].srac030,l_sffb016
      DISPLAY g_srac_d[l_ac].srac030 TO srac030_1 
      IF g_srac_d[l_ac].srac030 <=0 THEN
         CALL g_srac_d.deleteElement(l_ac)
         CONTINUE FOREACH
      END IF
                   
#display工单对应料件的品名规格                                   
      CALL s_desc_get_item_desc(g_srac_d[l_ac].srac004_1)
      RETURNING g_srac_d[l_ac].srac004_1_desc,g_srac_d[l_ac].srac004_1_desc_1 

#显示作业编号名称
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac_d[l_ac].srac008_1
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac_d[l_ac].srac008_1_desc = '', g_rtn_fields[1] , ''
      DISPLAY g_srac_d[l_ac].srac008_1_desc TO srac008_1_desc
            
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


   CALL g_srac_d.deleteElement(g_srac_d.getLength())


   #將key欄位填到每個page
   FOR g_detail_idx = 1 TO g_srac_d.getLength()

   END FOR
   LET g_detail_idx = 1

   LET g_detail_cnt = l_ac - 1
   LET g_msg = cl_getmsg_parm('asf-00283',g_dlang,g_detail_cnt)
   CALL cl_set_comp_att_text('page1',g_msg)
   LET l_ac = g_cnt
   LET g_cnt = 0

   CLOSE b_fill_curs
   FREE asrp330_pb

   LET l_ac = 1


END FUNCTION

PRIVATE FUNCTION asrp330_set_entry_b(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1
   {</Local define>}
   #add-point:set_entry_b段define
   
   #end add-point

   #add-point:set_entry段欄位控制後
   
   #end add-point

END FUNCTION

PRIVATE FUNCTION asrp330_set_no_entry_b(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1
   
   CALL cl_set_comp_entry("srac004_1,srac030_1,srac005_1,srac006_1,srac008_1,srac009_1",FALSE)
   CALL cl_set_comp_entry("srac004_2,srac031_2,srac005_2,srac006_2,srac008_2,srac009_2",FALSE)
   CALL cl_set_comp_entry("srac004_3,srac032_3,srac005_3,srac006_3,srac008_3,srac009_3",FALSE)
   CALL cl_set_comp_entry("srac004_4,srac034_4,srac005_4,srac006_4,srac008_4,srac009_4",FALSE)
   CALL cl_set_comp_entry("srac004_5,srac035_5,srac005_5,srac006_5,srac008_5,srac009_5",FALSE)
            

END FUNCTION

PRIVATE FUNCTION asrp330_default_search()
   {<Local define>}
   DEFINE li_idx  LIKE type_t.num5
   DEFINE li_cnt  LIKE type_t.num5
   DEFINE ls_wc   STRING
   {</Local define>}
   #add-point:default_search段define
   
   #end add-point

   IF NOT cl_null(g_argv[1]) THEN
      LET ls_wc = ls_wc, " srac007 = '", g_argv[1], "' AND "
   END IF



   IF NOT cl_null(ls_wc) THEN
      LET ls_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_wc = ls_wc
   ELSE
      LET g_wc = " 1=1"
   END IF

END FUNCTION

PRIVATE FUNCTION asrp330_b2_fill(p_wc2)
   {<Local define>}
   DEFINE p_wc2           STRING
   DEFINE l_sffb016       LIKE type_t.num5
   {</Local define>}

   LET g_sql = "SELECT  UNIQUE 'N',srac004,srac031,'','',srac005,srac006,srac008,'',srac009 FROM srac_t",
               " WHERE sracent=? AND sracsite=?  AND ", p_wc2

   LET g_sql = g_sql, " ORDER BY srac_t.srac004 "

   PREPARE asrp330_pb2 FROM g_sql
   DECLARE b_fill_curs2 CURSOR FOR asrp330_pb2

   OPEN b_fill_curs2 USING g_enterprise,g_site

   CALL g_srac2_d.clear()

   LET g_cnt = l_ac2
   LET l_ac2 = 1
   ERROR "Searching!"

   FOREACH b_fill_curs2 INTO g_srac2_d[l_ac2].chk2,g_srac2_d[l_ac2].srac004_2,g_srac2_d[l_ac2].srac031,
       g_srac2_d[l_ac2].srac004_2_desc,g_srac2_d[l_ac2].srac004_2_desc_1,g_srac2_d[l_ac2].srac005,
       g_srac2_d[l_ac2].srac006,g_srac2_d[l_ac2].srac008_2,g_srac2_d[l_ac2].srac008_2_desc,g_srac2_d[l_ac2].srac009
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
#待处理数量要扣除未审核的其他报工单数量，小于等于0的排除掉
      #CALL s_asrt335_set_qty('','','2',g_sffb_m.sffb025,g_srac2_d[l_ac2].srac004_2,g_srac2_d[l_ac2].srac005,g_srac2_d[l_ac2].srac006,g_srac2_d[l_ac2].srac008_2,g_srac2_d[l_ac2].srac009)  #161228-00028#2 mark    
      CALL s_asrt335_set_qty('','','12',g_sffb_m.sffb025,g_srac2_d[l_ac2].srac004_2,g_srac2_d[l_ac2].srac005,g_srac2_d[l_ac2].srac006,g_srac2_d[l_ac2].srac008_2,g_srac2_d[l_ac2].srac009)  #161228-00028#2 add    
      RETURNING g_srac2_d[l_ac2].srac031,l_sffb016
      DISPLAY g_srac2_d[l_ac2].srac031 TO srac031_2
      IF g_srac2_d[l_ac2].srac031 <=0 THEN
         CALL g_srac2_d.deleteElement(l_ac2)
         CONTINUE FOREACH
      END IF
              
#display工单对应料件的品名规格                                   
      CALL s_desc_get_item_desc(g_srac2_d[l_ac2].srac004_2)
      RETURNING g_srac2_d[l_ac2].srac004_2_desc,g_srac2_d[l_ac2].srac004_2_desc_1

#显示作业编号名称
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac2_d[l_ac2].srac008_2
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac2_d[l_ac2].srac008_2_desc = '', g_rtn_fields[1] , ''
      DISPLAY g_srac2_d[l_ac2].srac008_2_desc TO srac008_2_desc
      
      LET l_ac2 = l_ac2 + 1
      IF l_ac2 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ""
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

   END FOREACH
   LET g_error_show = 0


   CALL g_srac2_d.deleteElement(g_srac2_d.getLength())


   #將key欄位填到每個page
   FOR g_detail_idx = 1 TO g_srac_d.getLength()

   END FOR
   LET g_detail_idx = 1

   LET g_detail_cnt = l_ac2 - 1
   LET g_msg = cl_getmsg_parm('asf-00284',g_dlang,g_detail_cnt)
   CALL cl_set_comp_att_text('page2',g_msg)
   LET l_ac2 = g_cnt
   LET g_cnt = 0

   CLOSE b_fill_curs2
   FREE asrp330_pb2

   LET l_ac2 = 1

END FUNCTION

PRIVATE FUNCTION asrp330_b3_fill(p_wc2)
   {<Local define>}
   DEFINE p_wc2           STRING
   DEFINE l_sffb016       LIKE type_t.num5
   {</Local define>}

   LET g_sql = "SELECT  UNIQUE 'N',srac004,srac032,'','',srac005,srac006,srac008,'',srac009 FROM srac_t",
               " WHERE sracent=? AND sracsite=?  AND ", p_wc2

   LET g_sql = g_sql, " ORDER BY srac_t.srac004 "

   PREPARE asrp330_pb3 FROM g_sql
   DECLARE b_fill_curs3 CURSOR FOR asrp330_pb3

   OPEN b_fill_curs3 USING g_enterprise,g_site

   CALL g_srac3_d.clear()

   LET g_cnt = l_ac3
   LET l_ac3 = 1
   ERROR "Searching!"

   FOREACH b_fill_curs3 INTO g_srac3_d[l_ac3].chk3,g_srac3_d[l_ac3].srac004_3,g_srac3_d[l_ac3].srac032,
       g_srac3_d[l_ac3].srac004_3_desc,g_srac3_d[l_ac3].srac004_3_desc_1,g_srac3_d[l_ac3].srac005,
       g_srac3_d[l_ac3].srac006,g_srac3_d[l_ac3].srac008_3,g_srac3_d[l_ac3].srac008_3_desc,g_srac3_d[l_ac3].srac009
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
#待处理数量要扣除未审核的其他报工单数量，小于等于0的排除掉
      #CALL s_asrt335_set_qty('','','3',g_sffb_m.sffb025,g_srac3_d[l_ac3].srac004_3,g_srac3_d[l_ac3].srac005,g_srac3_d[l_ac3].srac006,g_srac3_d[l_ac3].srac008_3,g_srac3_d[l_ac3].srac009)  #161228-00028#2 mark     
      CALL s_asrt335_set_qty('','','13',g_sffb_m.sffb025,g_srac3_d[l_ac3].srac004_3,g_srac3_d[l_ac3].srac005,g_srac3_d[l_ac3].srac006,g_srac3_d[l_ac3].srac008_3,g_srac3_d[l_ac3].srac009)  #161228-00028#2 add     
      RETURNING g_srac3_d[l_ac3].srac032,l_sffb016
      DISPLAY g_srac3_d[l_ac3].srac032 TO srac032_3
      IF g_srac3_d[l_ac3].srac032 <=0 THEN
         CALL g_srac3_d.deleteElement(l_ac3)
         CONTINUE FOREACH
      END IF
                    
#display生产料号的品名规格                                   
      CALL s_desc_get_item_desc(g_srac3_d[l_ac3].srac004_3)
      RETURNING g_srac3_d[l_ac3].srac004_3_desc,g_srac3_d[l_ac3].srac004_3_desc_1

#显示作业编号名称
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac3_d[l_ac3].srac008_3
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac3_d[l_ac3].srac008_3_desc = '', g_rtn_fields[1] , ''
      DISPLAY g_srac3_d[l_ac3].srac008_3_desc TO srac008_3_desc
      
      LET l_ac3 = l_ac3 + 1
      IF l_ac3 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ""
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

   END FOREACH
   LET g_error_show = 0


   CALL g_srac3_d.deleteElement(g_srac3_d.getLength())


   #將key欄位填到每個page
   FOR g_detail_idx = 1 TO g_srac3_d.getLength()

   END FOR
   LET g_detail_idx = 1

   LET g_detail_cnt = l_ac3 - 1
   LET g_msg = cl_getmsg_parm('asf-00285',g_dlang,g_detail_cnt)
   CALL cl_set_comp_att_text('page3',g_msg)
   LET l_ac3 = g_cnt
   LET g_cnt = 0

   CLOSE b_fill_curs3
   FREE asrp330_pb3

   LET l_ac3 = 1

END FUNCTION

PRIVATE FUNCTION asrp330_b4_fill(p_wc2)
   {<Local define>}
   DEFINE p_wc2           STRING
   DEFINE l_sffb016       LIKE type_t.num5
   {</Local define>}

   LET g_sql = "SELECT  UNIQUE 'N',srac004,srac034,'','',srac005,srac006,srac008,'',srac009 FROM srac_t",
               " WHERE sracent=? AND sracsite=?  AND ", p_wc2

   LET g_sql = g_sql, " ORDER BY srac_t.srac004 "

   PREPARE asrp330_pb4 FROM g_sql
   DECLARE b_fill_curs4 CURSOR FOR asrp330_pb4

   OPEN b_fill_curs4 USING g_enterprise,g_site

   CALL g_srac4_d.clear()

   LET g_cnt = l_ac4
   LET l_ac4 = 1
   ERROR "Searching!"

   FOREACH b_fill_curs4 INTO g_srac4_d[l_ac4].chk4,g_srac4_d[l_ac4].srac004_4,g_srac4_d[l_ac4].srac034,
       g_srac4_d[l_ac4].srac004_4_desc,g_srac4_d[l_ac4].srac004_4_desc_1,g_srac4_d[l_ac4].srac005,
       g_srac4_d[l_ac4].srac006,g_srac4_d[l_ac4].srac008_4,g_srac4_d[l_ac4].srac008_4_desc,g_srac4_d[l_ac4].srac009
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
#待处理数量要扣除未审核的其他报工单数量，小于等于0的排除掉
      #CALL s_asrt335_set_qty('','','4',g_sffb_m.sffb025,g_srac4_d[l_ac4].srac004_4,g_srac4_d[l_ac4].srac005,g_srac4_d[l_ac4].srac006,g_srac4_d[l_ac4].srac008_4,g_srac4_d[l_ac4].srac009)    #161228-00028#2 mark  
      CALL s_asrt335_set_qty('','','14',g_sffb_m.sffb025,g_srac4_d[l_ac4].srac004_4,g_srac4_d[l_ac4].srac005,g_srac4_d[l_ac4].srac006,g_srac4_d[l_ac4].srac008_4,g_srac4_d[l_ac4].srac009)    #161228-00028#2 add  
      RETURNING g_srac4_d[l_ac4].srac034,l_sffb016
      DISPLAY g_srac4_d[l_ac4].srac034 TO srac034_4
      IF g_srac4_d[l_ac4].srac034 <=0 THEN
         CALL g_srac4_d.deleteElement(l_ac4)
         CONTINUE FOREACH
      END IF               
#display工单对应料件的品名规格                                   
      CALL s_desc_get_item_desc(g_srac4_d[l_ac4].srac004_4)
      RETURNING g_srac4_d[l_ac4].srac004_4_desc,g_srac4_d[l_ac4].srac004_4_desc_1 

#显示作业编号名称
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac4_d[l_ac4].srac008_4
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac4_d[l_ac4].srac008_4_desc = '', g_rtn_fields[1] , ''
      DISPLAY g_srac4_d[l_ac4].srac008_4_desc TO srac008_4_desc
      
      LET l_ac4 = l_ac4 + 1
      IF l_ac4 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ""
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

   END FOREACH
   LET g_error_show = 0


   CALL g_srac4_d.deleteElement(g_srac4_d.getLength())


   #將key欄位填到每個page
   FOR g_detail_idx = 1 TO g_srac4_d.getLength()

   END FOR
   LET g_detail_idx = 1

   LET g_detail_cnt = l_ac4 - 1
   LET g_msg = cl_getmsg_parm('asf-00286',g_dlang,g_detail_cnt)
   CALL cl_set_comp_att_text('page4',g_msg)
   LET l_ac4 = g_cnt
   LET g_cnt = 0

   CLOSE b_fill_curs4
   FREE asrp330_pb4

   LET l_ac4 = 1

END FUNCTION

PRIVATE FUNCTION asrp330_b5_fill(p_wc2)
   {<Local define>}
   DEFINE p_wc2           STRING
   DEFINE l_sffb016       LIKE type_t.num5
   {</Local define>}

   LET g_sql = "SELECT  UNIQUE 'N',srac004,srac035,'','',srac005,srac006,srac008,'',srac009 FROM srac_t",
               " WHERE sracent=? AND sracsite=?  AND ", p_wc2

   LET g_sql = g_sql, " ORDER BY srac_t.srac004 "

   PREPARE asrp330_pb5 FROM g_sql
   DECLARE b_fill_curs5 CURSOR FOR asrp330_pb5

   OPEN b_fill_curs5 USING g_enterprise,g_site

   CALL g_srac5_d.clear()

   LET g_cnt = l_ac5
   LET l_ac5 = 1
   ERROR "Searching!"

   FOREACH b_fill_curs5 INTO g_srac5_d[l_ac5].chk5,g_srac5_d[l_ac5].srac004_5,g_srac5_d[l_ac5].srac035,
       g_srac5_d[l_ac5].srac004_5_desc,g_srac5_d[l_ac5].srac004_5_desc_1,g_srac5_d[l_ac5].srac005,
       g_srac5_d[l_ac5].srac006,g_srac5_d[l_ac5].srac008_5,g_srac5_d[l_ac5].srac008_5_desc,g_srac5_d[l_ac5].srac009
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
#待处理数量要扣除未审核的其他报工单数量，小于等于0的排除掉
      #CALL s_asrt335_set_qty('','','5',g_sffb_m.sffb025,g_srac5_d[l_ac5].srac004_5,g_srac5_d[l_ac5].srac005,g_srac5_d[l_ac5].srac006,g_srac5_d[l_ac5].srac008_5,g_srac5_d[l_ac5].srac009)    #161228-00028#2 mark    
      CALL s_asrt335_set_qty('','','15',g_sffb_m.sffb025,g_srac5_d[l_ac5].srac004_5,g_srac5_d[l_ac5].srac005,g_srac5_d[l_ac5].srac006,g_srac5_d[l_ac5].srac008_5,g_srac5_d[l_ac5].srac009)    #161228-00028#2 add    
      RETURNING g_srac5_d[l_ac5].srac035,l_sffb016
      DISPLAY g_srac5_d[l_ac5].srac035 TO srac035_5
      IF g_srac5_d[l_ac5].srac035 <=0 THEN
         CALL g_srac5_d.deleteElement(l_ac5)
         CONTINUE FOREACH
      END IF               
#display工单对应料件的品名规格                                   
      CALL s_desc_get_item_desc(g_srac5_d[l_ac5].srac004_5)
      RETURNING g_srac5_d[l_ac5].srac004_5_desc,g_srac5_d[l_ac5].srac004_5_desc_1 

#显示作业编号名称
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_srac5_d[l_ac5].srac008_5
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_srac5_d[l_ac5].srac008_5_desc = '', g_rtn_fields[1] , ''
      DISPLAY g_srac5_d[l_ac5].srac008_5_desc TO srac008_5_desc
      
      LET l_ac5 = l_ac5 + 1
      IF l_ac5 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ""
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

   END FOREACH
   LET g_error_show = 0


   CALL g_srac5_d.deleteElement(g_srac5_d.getLength())


   #將key欄位填到每個page
   FOR g_detail_idx = 1 TO g_srac5_d.getLength()

   END FOR
   LET g_detail_idx = 1

   LET g_detail_cnt = l_ac5 - 1
   LET g_msg = cl_getmsg_parm('asf-00287',g_dlang,g_detail_cnt)
   CALL cl_set_comp_att_text('page5',g_msg)
   LET l_ac5 = g_cnt
   LET g_cnt = 0

   CLOSE b_fill_curs5
   FREE asrp330_pb5

   LET l_ac5 = 1

END FUNCTION
################################################################################
# Descriptions...: 参考asrt335
# Memo...........:
# Usage..........: CALL asrp330_set_entry(p_cmd)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_set_entry(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1  
   {</Local define>}
   #add-point:set_entry段define

   #end add-point       

   
   #add-point:set_entry段欄位控制後
   CALL cl_set_comp_entry("sffb007_1,sffb008_1",TRUE)
   CALL cl_set_comp_entry("sffb017_1,sffb018_1,sffb019_1,sffb020_1",TRUE) 
   #end add-point 

END FUNCTION
################################################################################
# Descriptions...: 参考asrt335
# Memo...........:
# Usage..........: CALL asrp330_set_no_entry(p_cmd)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_set_no_entry(p_cmd)
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define
   DEFINE l_cnt      LIKE type_t.num5
   DEFINE l_sfaa061  LIKE sfaa_t.sfaa061
   DEFINE l_srab007  LIKE srab_t.srab007
   #end add-point     
 
   #add-point:set_no_entry段欄位控制後
#根据生产计划制程否决定作业编号和制程序栏位的动态开启关闭，这里是有条件的关闭
  
    SELECT srab007 INTO l_srab007 
      FROM srab_t
     WHERE srabent   = g_enterprise
       AND srabsite  = g_site
       AND srab001   = g_sffb_m.sffb025 
       AND srab004   = g_sffb_m1.sffb026
       AND srab005   = g_sffb_m1.sffb027       
       AND srab006   = g_sffb_m1.sffb028 
   
   IF l_srab007 = 'N' THEN
      CALL cl_set_comp_entry("sffb007_1,sffb008_1",FALSE)
      LET g_sffb_m1.sffb007 = ' '  
      LET g_sffb_m1.sffb007_desc = NULL
      LET g_sffb_m1.sffb008 = ' ' 
      DISPLAY BY NAME g_sffb_m1.sffb007_desc                     
   END IF   
      
   IF g_sffb_m1.sffb001 MATCHES '[1245]' THEN
      LET g_sffb_m1.sffb018 = 0
      LET g_sffb_m1.sffb019 = 0
      LET g_sffb_m1.sffb020 = 0
      CALL cl_set_comp_entry("sffb018_1,sffb019_1,sffb020_1",FALSE)
   END IF
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM srac_t
    WHERE sracent = g_enterprise
      AND srac001 = g_sffb_m.sffb025 
      AND srac004 = g_sffb_m1.sffb026
      AND srac005 = g_sffb_m1.sffb027
      AND srac006 = g_sffb_m1.sffb028
      AND srac016 = 'Y'
      
   IF l_cnt = 0 THEN     #制程里没有设回收站，报工不可填回收数量
      LET g_sffb_m1.sffb020 = 0
      CALL cl_set_comp_entry("sffb020_1",FALSE)
   END IF
#当站报废使用申请流程时，不可在报工单上输入报废数量
   IF cl_get_para(g_enterprise,g_site,'S-MFG-0033') = 'Y' THEN 
      LET g_sffb_m1.sffb018 = 0   
      CALL cl_set_comp_entry("sffb018_1,",FALSE)
   END IF


END FUNCTION
################################################################################
# Descriptions...: 计算器界面，可在sffb014_1,sffb015_1,sffb017_1,sffb018_1,sffb019_1,sffb020_1输入数字
# Memo...........:
# Usage..........: CALL asrp330_calculator(p_cmd)
#                  RETURNING 
# Input parameter: p_cmd          计算器按键值
# Return code....: 回传参数变量1   回传参数变量说明2
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/02/18 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_calculator(p_cmd)
   DEFINE  p_cmd         LIKE type_t.chr1          #代表用户按了计算器哪个按键
                                                   #其中'.'表示小数点，'d'表示DEL
                                                   #'c'表示ce，'e'表示enter，数字键的值用阿拉伯数字表示
                                                   #特别提示:'00'用'x'代替
   DEFINE  l_amt         LIKE sffb_t.sffb017
   DEFINE  l_curr_field  LIKE type_t.chr10
   DEFINE  l_str         STRING

#ENTER按键开放给整个报工咨讯页签用，按一下相当于按实体键盘的enter键，会走到下一个栏位
   IF p_cmd = 'e' THEN      #按下的是ENTER键
      RETURN
   END IF


#基本逻辑为：
#step1：定义一个全局变量g_calc_field,表示计算器当前定焦的栏位
#       定义一个全局变量g_calc_amt,表示计算器输入过程中暂存的数值（含小数点，所以定义成字符串先）
#step2：进入此函数时先判断g_calc_field是否为空，为空时赋予当前INFIELD的值，同时g_calc_amt也清0
#       如果g_calc_field不为空，则判断与当前INFIELD是否相同，相同时保留g_calc_amt继续输入
#                                                         不相同表示换栏位键入了，g_calc_field赋值，g_calc_amt取对应栏位值      
#step3：g_calc_amt字符串后面接上传入的p_cmd，也就是按下的按键值
#step4：上步处理中要区分处理0-9，'.'，DEL这几种情况
#step5：执行完step4后，g_calc_amt内存着键入当前一个按键后的数值，马上根据INFIELD赋值给对应的变量，DISPLAY
#       CE和ENTER不需要分情况处理，CE将g_calc_amt清0，ENTER执行NEXT FIELD
   
#先确定按下按键时，当前处于哪个FIELD里，不在规定栏位里的，RETURN 
   LET l_curr_field = NULL
   CASE 
      WHEN INFIELD(sffb014_1)
        LET l_curr_field = 'sffb014_1'
        LET l_amt  = g_sffb_m1.sffb014
      WHEN INFIELD(sffb015_1)
        LET l_curr_field = 'sffb015_1'
        LET l_amt  = g_sffb_m1.sffb015       
      WHEN INFIELD(sffb017_1) 
        LET l_curr_field = 'sffb017_1'
        LET l_amt  = g_sffb_m1.sffb017
      WHEN INFIELD(sffb018_1) 
        LET l_curr_field = 'sffb018_1'
        LET l_amt  = g_sffb_m1.sffb018
      WHEN INFIELD(sffb019_1)
        LET l_curr_field = 'sffb019_1'
        LET l_amt  = g_sffb_m1.sffb019        
      WHEN INFIELD(sffb020_1)
        LET l_curr_field = 'sffb020_1' 
        LET l_amt  = g_sffb_m1.sffb020        
      OTHERWISE RETURN
        RETURN 
   END CASE
#g_calc_field存的是上次按计算器时所处的栏位，若与本次栏位不同，则说明换了栏位，g_calc_field赋值本次栏位，g_calc_amt都清空，等待新栏位的使用
   IF g_calc_field IS NOT NULL THEN
      IF g_calc_field !=  l_curr_field THEN
         LET g_calc_field =  l_curr_field
         LET g_calc_amt =  NULL
      END IF
   ELSE
#第一次用
      LET g_calc_field =  l_curr_field
      LET g_calc_amt =  NULL
   END IF
#开始处理
#将新进的栏位里，类似7.000这样的数字规整成7这样的整数
   LET g_calc_amt = asrp330_cut_zero(l_amt)
   IF g_calc_amt IS NOT NULL THEN
#如果暂存数存在值，需要判断是否符合num20_6的格式，超出范围的按键需求都会被return，CE和DEL除外
#判断1：总长不得大于20
      IF g_calc_amt.getlength() >=20 AND ((p_cmd >= 0 AND  p_cmd <=9) OR p_cmd = '.' OR p_cmd ='x') THEN 
         RETURN
      END IF
#判断2：小数位不得大于6   
      IF (g_calc_amt.getlength() - s_chr_get_index_of(g_calc_amt,'.',1)) >= 6 AND ((p_cmd >= 0 AND  p_cmd <=9) OR p_cmd = '.' OR p_cmd ='x') THEN 
         RETURN
      END IF
   END IF
   
   IF g_calc_amt IS NULL THEN LET g_calc_amt = 0 END IF
   
   IF s_chr_get_index_of(g_calc_amt,'.',1) >0 THEN                         #已有小数点，这时候再按'.'，直接return
      IF p_cmd = '.' THEN RETURN END IF
   END IF  
   
   IF (p_cmd >= 0 AND  p_cmd <=9) OR p_cmd = '.' OR p_cmd ='x' THEN
      IF g_calc_amt = '0' THEN   #原来是0的，再输一位不能变成07，要变成7这样的
         LET g_calc_amt = p_cmd CLIPPED
      ELSE
         IF p_cmd = 'x' THEN  #'x'表示'00'
            LET g_calc_amt = g_calc_amt CLIPPED,'00' CLIPPED
         ELSE
            LET g_calc_amt = g_calc_amt CLIPPED,p_cmd CLIPPED
         END IF
      END IF
   END IF
   
   IF p_cmd = 'c' THEN      #清零
      LET g_calc_amt = 0 
   END IF
   IF p_cmd = 'd' THEN      #从最后开始减掉一位
      IF g_calc_amt.getlength() > 1 THEN
         LET g_calc_amt = g_calc_amt.substring(1,g_calc_amt.getlength()-1)
      ELSE
         LET g_calc_amt = 0
      END IF
   END IF

#赋值给当前栏位的变量
   CASE 
      WHEN INFIELD(sffb014_1)
        LET g_sffb_m1.sffb014 = g_calc_amt
      WHEN INFIELD(sffb015_1)
        LET g_sffb_m1.sffb015 = g_calc_amt        
      WHEN INFIELD(sffb017_1) 
        LET g_sffb_m1.sffb017 = g_calc_amt
      WHEN INFIELD(sffb018_1) 
        LET g_sffb_m1.sffb018 = g_calc_amt
      WHEN INFIELD(sffb019_1)
        LET g_sffb_m1.sffb019 = g_calc_amt        
      WHEN INFIELD(sffb020_1)
        LET g_sffb_m1.sffb020 = g_calc_amt         
   END CASE
   

END FUNCTION
################################################################################
# Descriptions...: 将sffb013设置成HH:MM的输入格式
# Memo...........:
# Usage..........: CALL asrp330_set_sffb013_format()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_set_sffb013_format()
   DEFINE   ls_field     STRING
   DEFINE   lwin_curr    ui.Window
   DEFINE   lfrm_curr    ui.Form
   DEFINE   lnode_item   om.DomNode
   DEFINE   lnode_child  om.DomNode
   DEFINE   ls_picture   STRING              # 單據編號格式設定
   DEFINE   li_i         LIKE type_t.num10    
   DEFINE   ls_tabname   STRING             
   DEFINE   ls_sql       STRING

 
 
   LET lwin_curr = ui.Window.getCurrent()
   LET lfrm_curr = lwin_curr.getForm()
   IF lfrm_curr IS NULL THEN
      RETURN
   END IF
 
   LET ls_tabname = 'sffb_t'
   LET ls_field   = 'sffb013_1'
   LET lnode_item = lfrm_curr.findNode("FormField",ls_field)
#   LET lnode_item = lfrm_curr.findNode("FormField",ls_tabname||"."||ls_field) 
#   IF lnode_item IS NULL THEN
#      LET lnode_item = lfrm_curr.findNode("TableColumn",ls_tabname||"."||ls_field)  
#      IF lnode_item IS NULL THEN
#         LET lnode_item = lfrm_curr.findNode("Matrix",ls_tabname||"."||ls_field)
#         IF lnode_item IS NULL THEN
#            RETURN
#         END IF
#      END IF
#   END IF
 
   LET lnode_child = lnode_item.getFirstChild()

   FOR li_i = 1 TO 2
       LET ls_picture = ls_picture,"#"
   END FOR
 
   LET ls_picture = ls_picture,":"
 
   FOR li_i = 1 TO 2
       LET ls_picture = ls_picture,"#"
   END FOR
 
   CALL lnode_child.setAttribute("picture",ls_picture)
END FUNCTION
################################################################################
# Descriptions...: 利用单头组建where子句，支持下面5个单身的条件选出
# Memo...........:
# Usage..........: CALL asrp330_gen_wc()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/02/18 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_gen_wc()
   LET g_wc1 = NULL
   LET g_wc2 = NULL
   LET g_wc3 = NULL
   LET g_wc4 = NULL
   LET g_wc5 = NULL
   
   LET g_wc0 = " srac016 = '",g_sffb_m.sffb009,"' "
   IF g_sffb_m.sffb007 IS NOT NULL THEN
      LET g_wc0 = g_wc0," AND srac008 = '",g_sffb_m.sffb007,"' "
   END IF
   IF g_sffb_m.sffb025 IS NOT NULL THEN
      LET g_wc0 = g_wc0," AND srac001 = '",g_sffb_m.sffb025,"' "
   END IF
#g_wc1:工作站+作业编号+待move in数量大于0的工单制程资料
   LET g_wc1 = g_wc0," AND srac030 > 0 "
#g_wc2:工作站+作业编号+待check in数量大于0的工单制程资料
   LET g_wc2 = g_wc0," AND srac031 > 0 "
#g_wc3:工作站+作业编号+在制数量大于0的工单制程资料
   LET g_wc3 = g_wc0," AND srac032 > 0 "
#g_wc4:工作站+作业编号+待check out大于0的工单制程资料
   LET g_wc4 = g_wc0," AND srac034 > 0 "
#g_wc5:工作站+作业编号+待move out数量大于0的工单制程资料
   LET g_wc5 = g_wc0," AND srac035 > 0 "
END FUNCTION
################################################################################
# Descriptions...: 检查目前5个单身勾选Y的资料有几笔
# Memo...........:
# Usage..........: CALL asrp330_chk_count()
#                  RETURNING r_count
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: r_count      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/02/21 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_chk_count()
   DEFINE r_count        LIKE type_t.num5
   DEFINE i              LIKE type_t.num5
   
   LET r_count = 0 
   IF g_srac_d.getlength() > 0 THEN
      FOR i=1 TO g_srac_d.getlength()
          IF g_srac_d[i].chk1 = 'Y' THEN
             LET r_count = r_count + 1
          END IF
      END FOR
   END IF

   IF g_srac2_d.getlength() > 0 THEN
      FOR i=1 TO g_srac2_d.getlength()
          IF g_srac2_d[i].chk2 = 'Y' THEN
             LET r_count = r_count + 1
          END IF
      END FOR
   END IF
   
   IF g_srac3_d.getlength() > 0 THEN
      FOR i=1 TO g_srac3_d.getlength()
          IF g_srac3_d[i].chk3 = 'Y' THEN
             LET r_count = r_count + 1
          END IF
      END FOR
   END IF
   
   IF g_srac4_d.getlength() > 0 THEN
      FOR i=1 TO g_srac4_d.getlength()
          IF g_srac4_d[i].chk4 = 'Y' THEN
             LET r_count = r_count + 1
          END IF
      END FOR
   END IF
   
   IF g_srac5_d.getlength() > 0 THEN
      FOR i=1 TO g_srac5_d.getlength()
          IF g_srac5_d[i].chk5 = 'Y' THEN
             LET r_count = r_count + 1
          END IF
      END FOR
   END IF
   
   RETURN r_count
END FUNCTION
################################################################################
# Descriptions...: 5个单身填充
# Memo...........:
# Usage..........: CALL asrp330_b_fill()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/02/18 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_b_fill()
   CALL g_srac_d.clear()
   CALL g_srac2_d.clear()
   CALL g_srac3_d.clear()
   CALL g_srac4_d.clear()
   CALL g_srac5_d.clear()
   
   CALL asrp330_b1_fill(g_wc1)
   CALL asrp330_b2_fill(g_wc2)
   CALL asrp330_b3_fill(g_wc3)
   CALL asrp330_b4_fill(g_wc4)
   CALL asrp330_b5_fill(g_wc5)
   CALL asrp330_hold_fill()
   
   
END FUNCTION
################################################################################
# Descriptions...: 将传入数去掉最后的0，类似7.00100这样的数字规整成7.001这样的整数
# Memo...........:
# Usage..........: CALL asrp330_cut_zero(p_amt)
#                  RETURNING r_amt
# Input parameter: p_amt          传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: r_amt          回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/02/26 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_cut_zero(p_amt)
   DEFINE p_amt   STRING    #定义成string是因为如果定义成数字，去掉的0赋值后又会出现
   DEFINE r_amt   STRING

   IF p_amt IS NULL THEN
      LET r_amt = p_amt
      RETURN r_amt
   END IF
   
   IF s_chr_get_index_of(p_amt,'.',1) = 0 THEN  #没有小数点的整数不需要去0
      LET r_amt = p_amt
      RETURN r_amt
   END IF
   
   IF p_amt = '0' THEN 
      LET r_amt = p_amt
      RETURN r_amt
   END IF
   WHILE TRUE
     IF p_amt.substring(p_amt.getlength(),p_amt.getlength()) = '0' THEN
        LET p_amt = p_amt.substring(1,p_amt.getlength()-1)
        IF p_amt = '0' THEN
           LET r_amt = p_amt        
           EXIT WHILE 
        END IF 
        IF p_amt = '.' THEN
           LET p_amt = '0'
           LET r_amt = p_amt        
           EXIT WHILE 
        END IF                   
     ELSE
        IF p_amt.substring(p_amt.getlength(),p_amt.getlength()) = '.' THEN
           LET p_amt = p_amt.substring(1,p_amt.getlength()-1)
           LET r_amt = p_amt        
           EXIT WHILE
        END IF
        LET r_amt = p_amt
        EXIT WHILE
     END IF
   END WHILE
   RETURN r_amt
END FUNCTION
################################################################################
# Descriptions...: 根据传入的一行勾选单身产生报工咨讯页签资料
# Memo...........:
# Usage..........: CALL asrp330_gen_sffb_m1(p_sffb001,p_srac)
#                  RETURNING 回传参数
# Input parameter: p_sffb001      报工类型
#                : p_srac         当前勾选的这行单身资料
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/02/21 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_gen_sffb_m1(p_sffb001,p_srac)
   DEFINE p_sffb001   LIKE sffb_t.sffb001
   DEFINE p_srac     type_g_srac_d         #5个单身的栏位都可以对应的，所以统一用第一个单身的定义
   DEFINE l_sffb009   LIKE sffb_t.sffb009
   
   IF p_srac.chk1 ='N' OR p_srac.chk1 IS NULL THEN 
      RETURN 
   END IF
    
   LET g_sffb_m1.sffb001 = p_sffb001
   LET g_sffb_m1.sffb026 = p_srac.srac004_1
   #display生产料号的品名规格                                   
   CALL s_desc_get_item_desc(g_sffb_m1.sffb026)
   RETURNING g_sffb_m1.sffb026_desc,g_sffb_m1.sffb026_desc_1
   DISPLAY g_sffb_m1.sffb026_desc TO sffb026_1_desc 
   DISPLAY g_sffb_m1.sffb026_desc_1 TO sffb026_1_desc_1
   
   LET g_sffb_m1.sffb027 = p_srac.srac005
   LET g_sffb_m1.sffb028 = p_srac.srac006
   
   LET g_sffb_m1.sffb007 = p_srac.srac008_1
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sffb_m1.sffb007
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sffb_m1.sffb007_desc = '', g_rtn_fields[1] , ''
   DISPLAY g_sffb_m1.sffb007_desc TO sffb007_1_desc
   
   LET g_sffb_m1.sffb008 = p_srac.srac009
 
   CALL s_asrt335_set_qty('','',g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008) 
   RETURNING g_sffb_m1.qty,g_sffb_m1.sffb016
   LET g_sffb_m1.sffb012 = cl_get_today()
   LET g_sffb_m1.sffb013 = cl_get_time()
   LET g_sffb_m1.sffb013 = g_sffb_m1.sffb013[1,5]
   LET g_sffb_m1.sffb014 = s_asrt335_get_working_time(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb012,g_sffb_m1.sffb013) * g_sffb_m.sffb011
   LET g_sffb_m1.sffb015 = s_asrt335_get_working_time(g_sffb_m1.sffb001,g_sffb_m.sffb025,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m1.sffb012,g_sffb_m1.sffb013)
   LET g_sffb_m1.sffb017 = g_sffb_m1.qty
   LET g_sffb_m1.sffb018 = 0
   LET g_sffb_m1.sffb019 = 0
   LET g_sffb_m1.sffb020 = 0
   LET g_sffb_m1.sffb021 = ''
   LET g_sffb_m1.sffb022 = ''
   
   DISPLAY BY NAME g_sffb_m1.sffb001,g_sffb_m1.sffb026,g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_sffb_m1.sffb007,g_sffb_m1.sffb008,
                   g_sffb_m1.sffb012,g_sffb_m1.sffb013,g_sffb_m1.sffb014,g_sffb_m1.sffb015,g_sffb_m1.qty,g_sffb_m1.sffb016,
                   g_sffb_m1.sffb017,g_sffb_m1.qty,g_sffb_m1.sffb018,g_sffb_m1.sffb019,g_sffb_m1.sffb020,g_sffb_m1.sffb021,g_sffb_m1.sffb022

#新产生的报工单资讯，要把老的不良原因和check in/check out清空
   CALL g_sffd_d.clear()
   CALL g_sffc_d.clear()
END FUNCTION
################################################################################
# Descriptions...: 刷新时判断是否当前勾选chk的那笔单身还存在于新刷出来的单身资料中，若存在，则这笔提到第一笔，且选择状态为Y
# Memo...........:
# Usage..........: CALL asrp330_hold_fill()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/02/28 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_hold_fill()
   DEFINE i         LIKE type_t.num5
   DEFINE l_flag    LIKE type_t.chr1    #是否有勾选中且数量不为0的单身
   
   IF asrp330_chk_count() > 1 THEN  #不能同时有两笔勾选
      RETURN
   END IF
   IF g_sffb001 IS NULL OR g_srac.chk1 <> 'Y' THEN
      RETURN
   END IF
   LET l_flag  ='N'
   CASE g_sffb001
     WHEN '1'         #Move in单身
     IF g_srac_d.getlength() > 0 THEN
        FOR i = 1 TO g_srac_d.getlength()
            IF g_srac_d[i].srac004_1 = g_srac.srac004_1 AND g_srac_d[i].srac005 = g_srac.srac005 AND
               g_srac_d[i].srac006 = g_srac.srac006 AND g_srac_d[i].srac008_1 = g_srac.srac008_1 AND
               g_srac_d[i].srac009 = g_srac.srac009 THEN
               LET g_srac.* = g_srac_d[i].*
               LET g_srac.chk1 = 'Y'
               CALL g_srac_d.deleteElement(i)
               CALL g_srac_d.insertElement(1)
               LET g_srac_d[i].* = g_srac.*
               LET l_flag ='Y'
               EXIT FOR
            END IF
        END FOR
     END IF
     WHEN '2'         #Check in单身
     IF g_srac2_d.getlength() > 0 THEN
        FOR i = 1 TO g_srac2_d.getlength()
             IF g_srac2_d[i].srac004_2 = g_srac.srac004_1 AND g_srac2_d[i].srac005 = g_srac.srac005 AND
               g_srac2_d[i].srac006 = g_srac.srac006 AND g_srac2_d[i].srac008_2 = g_srac.srac008_1 AND
               g_srac2_d[i].srac009 = g_srac.srac009 THEN
               LET g_srac.* = g_srac2_d[i].*
               LET g_srac.chk1 = 'Y'
               CALL g_srac2_d.deleteElement(i)
               CALL g_srac2_d.insertElement(1)
               LET g_srac2_d[1].* = g_srac.*
               LET l_flag ='Y'
               EXIT FOR
            END IF
        END FOR
     END IF
     WHEN '3'         #报工单身
     IF g_srac3_d.getlength() > 0 THEN
        FOR i = 1 TO g_srac_d.getlength()
            IF g_srac3_d[i].srac004_3 = g_srac.srac004_1 AND g_srac3_d[i].srac005 = g_srac.srac005 AND
               g_srac3_d[i].srac006 = g_srac.srac006 AND g_srac3_d[i].srac008_3 = g_srac.srac008_1 AND
               g_srac3_d[i].srac009 = g_srac.srac009 THEN
               LET g_srac.* = g_srac3_d[i].*
               LET g_srac.chk1 = 'Y'
               CALL g_srac3_d.deleteElement(i)
               CALL g_srac3_d.insertElement(1)
               LET g_srac3_d[1].* = g_srac.*
               LET l_flag ='Y'
               EXIT FOR
            END IF
        END FOR
     END IF
     WHEN '4'         #Move Out单身
     IF g_srac4_d.getlength() > 0 THEN
        FOR i = 1 TO g_srac4_d.getlength()
            IF g_srac4_d[i].srac004_4 = g_srac.srac004_1 AND g_srac4_d[i].srac005 = g_srac.srac005 AND
               g_srac4_d[i].srac006 = g_srac.srac006 AND g_srac4_d[i].srac008_4 = g_srac.srac008_1 AND
               g_srac4_d[i].srac009 = g_srac.srac009 THEN
               LET g_srac.* = g_srac4_d[i].*
               LET g_srac.chk1 = 'Y'
               CALL g_srac4_d.deleteElement(i)
               CALL g_srac4_d.insertElement(1)
               LET g_srac4_d[1].* = g_srac.*  
               LET l_flag ='Y'
               EXIT FOR
            END IF
        END FOR
     END IF
     WHEN '5'         #Check Out单身
     IF g_srac5_d.getlength() > 0 THEN
        FOR i = 1 TO g_srac5_d.getlength()
            IF g_srac5_d[i].srac004_5 = g_srac.srac004_1 AND g_srac5_d[i].srac005 = g_srac.srac005 AND
               g_srac5_d[i].srac006 = g_srac.srac006 AND g_srac5_d[i].srac008_5 = g_srac.srac008_1 AND
               g_srac5_d[i].srac009 = g_srac.srac009 THEN
               LET g_srac.* = g_srac5_d[i].* 
               LET g_srac.chk1 = 'Y'
               CALL g_srac5_d.deleteElement(i)
               CALL g_srac5_d.insertElement(1)
               LET g_srac5_d[1].* =  g_srac.*
               LET l_flag ='Y'
               EXIT FOR
            END IF
        END FOR
     END IF
   END CASE
   IF l_flag = 'N' THEN    #没有勾选的单身，要清除右面的报工咨讯内容
      LET g_sffb001 = NULL
      INITIALIZE g_srac.* TO NULL
      CALL g_sffd_d.clear()
      CALL g_sffc_d.clear()
   END IF
END FUNCTION
################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_commit()
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_time          LIKE sffb_t.sffbcrtdt

   IF asrp330_chk_count() = 0 THEN  
      RETURN
   END IF

#产生的报工单审核需要tmp表
   IF NOT s_asrt335_cre_tmp_table() THEN
      RETURN      
   END IF
   CALL s_transaction_begin()
   LET l_success = TRUE  
   #add-point:單頭新增前
   IF g_sffbdocno IS NULL THEN
   CALL s_aooi200_gen_docno(g_site,g_sffb_m.sffbdocno,g_today,'asrt335') RETURNING l_success,g_sffbdocno    #因为产生的资料是在asft335查询维护的，所以作业编号写asft335的
      IF NOT l_success THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'apm-00003'
         LET g_errparam.extend = g_sffb_m.sffbdocno
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET l_success = FALSE
      END IF
   END IF
   IF g_sffb_m1.sffb007 IS NULL THEN LET g_sffb_m1.sffb007 = ' ' END IF
   IF g_sffb_m1.sffb008 IS NULL THEN LET g_sffb_m1.sffb008 = ' ' END IF
   #end add-point
   IF l_success THEN
      LET l_time  = cl_get_current()
   #提交sffb
      INSERT INTO sffb_t (sffbent,sffbsite,sffbdocno,sffbseq,sffb001,sffb002,sffbdocdt,sffb003,
          sffbstus,sffb007,sffb008,sffb009,sffb004,sffb010,sffb025,sffb024,sffb011,sffb012,sffb013,sffb014,
          sffb015,sffb016,sffb017,sffb018,sffb019,sffb020,sffb021,sffb022,sffb026,sffb027,sffb028,sffbownid, 
          sffbowndp,sffbcrtid,sffbcrtdp,sffbcrtdt,sffbmodid,sffbmoddt,sffbcnfid,sffbcnfdt)
      VALUES (g_enterprise,g_site,g_sffbdocno,'0',g_sffb_m1.sffb001,g_sffb_m.sffb002, 
          g_today,g_sffb_m.sffb003,'N',g_sffb_m1.sffb007,g_sffb_m1.sffb008,g_sffb_m.sffb009,g_sffb_m.sffb004, 
          g_sffb_m.sffb010,g_sffb_m.sffb025,g_sffb_m.sffb024,g_sffb_m.sffb011,g_sffb_m1.sffb012,g_sffb_m1.sffb013, 
          g_sffb_m1.sffb014,g_sffb_m1.sffb015,g_sffb_m1.sffb016,g_sffb_m1.sffb017,g_sffb_m1.sffb018, 
          g_sffb_m1.sffb019,g_sffb_m1.sffb020,g_sffb_m1.sffb021,g_sffb_m1.sffb022,g_sffb_m1.sffb026,
          g_sffb_m1.sffb027,g_sffb_m1.sffb028,g_user,g_dept,g_user,g_dept,l_time,'','','','') 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT g_sffb_m1"
         LET g_errparam.popup = TRUE
         CALL cl_err()
  
         LET l_success = FALSE
      ELSE
      #提交sffd
         IF NOT asrp330_ins_sffd() THEN
            LET l_success = FALSE
         END IF
      #提交sffc
         IF NOT asrp330_ins_sffc() THEN
            LET l_success = FALSE
         END IF
         IF NOT s_asrt335_ins_sfha(g_sffbdocno,'0',g_sffb_m1.sffb019) THEN
            LET l_success = FALSE
         END IF 
      #报工单审核更新制程档   
         IF NOT s_asrt335_conf(g_sffbdocno) THEN           
            LET l_success = FALSE  
         END IF       
      END IF
   END IF
   IF l_success THEN
      CALL s_transaction_end('Y','0') 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00128'
      LET g_errparam.extend = g_sffbdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

   ELSE
      CALL s_transaction_end('N','0') 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00153'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
   END IF
   LET g_sffbdocno = NULL     #重置单号，为下次抛转做准备      
   CALL s_asrt335_drop_tmp_table()    
   CALL asrp330_refresh()
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_set_required()
   DEFINE l_srab007     LIKE srab_t.srab007
   DEFINE l_success     LIKE type_t.num5
   
   SELECT srab007 INTO l_srab007 
      FROM srab_t
     WHERE srabent   = g_enterprise
       AND srabsite  = g_site
       AND srab001   = g_sffb_m.sffb025 
       AND srab004   = g_sffb_m1.sffb026
       AND srab005   = g_sffb_m1.sffb027       
       AND srab006   = g_sffb_m1.sffb028     
   
   IF l_srab007 = 'Y' THEN
      CALL cl_set_comp_required("sffb007_1,sffb008_1",TRUE)              
   END IF 
   CALL s_aooi200_get_slip(g_sffb_m.sffbdocno) RETURNING l_success,g_doc_slip
   IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0068') ='Y' THEN 
      CALL cl_set_comp_required("sffb024",TRUE) 
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_set_no_required()
   CALL cl_set_comp_required("sffb007_1,sffb008_1,sffb024",FALSE)
END FUNCTION

################################################################################
# Descriptions...: 将5个单身的选择都设为N
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_set_srac_detail_n()
   DEFINE i              LIKE type_t.num5
   
   IF g_srac_d.getlength() > 0 THEN
      FOR i=1 TO g_srac_d.getlength()
          LET g_srac_d[i].chk1 = 'N' 
      END FOR
   END IF

   IF g_srac2_d.getlength() > 0 THEN
      FOR i=1 TO g_srac2_d.getlength()
          LET g_srac2_d[i].chk2 = 'N'
      END FOR
   END IF
   
   IF g_srac3_d.getlength() > 0 THEN
      FOR i=1 TO g_srac3_d.getlength()
          LET g_srac3_d[i].chk3 = 'N'        
      END FOR
   END IF
   
   IF g_srac4_d.getlength() > 0 THEN
      FOR i=1 TO g_srac4_d.getlength()
          LET g_srac4_d[i].chk4 = 'N' 
      END FOR
   END IF
   
   IF g_srac5_d.getlength() > 0 THEN
      FOR i=1 TO g_srac5_d.getlength()
          LET g_srac5_d[i].chk5 = 'N' 
      END FOR
   END IF
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_refresh()
   LET g_calc_field = NULL   #清空计算器用的缓存变量
   LET g_calc_amt   = NULL 
   IF g_sffb_m.sffb009 IS NOT NULL THEN
        CALL asrp330_gen_wc()
        CALL asrp330_b_fill()
        CALL asrp330_gen_sffb_m1(g_sffb001,g_srac.*) 
   END IF
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_ins_sffc()
   DEFINE r_success     LIKE type_t.num5
#   DEFINE l_sffc        RECORD LIKE sffc_t.*  161124-00048#10 mark
  #161124-00048#10 add(s)
  DEFINE l_sffc RECORD  #報工Check in/Check out專案檔
       sffcent LIKE sffc_t.sffcent, #企业编号
       sffcsite LIKE sffc_t.sffcsite, #营运据点
       sffcdocno LIKE sffc_t.sffcdocno, #报工单号
       sffcseq LIKE sffc_t.sffcseq, #项次
       sffc001 LIKE sffc_t.sffc001, #项目
       sffc002 LIKE sffc_t.sffc002, #型态
       sffc003 LIKE sffc_t.sffc003, #下限
       sffc004 LIKE sffc_t.sffc004, #上限
       sffc005 LIKE sffc_t.sffc005, #默认值
       sffc006 LIKE sffc_t.sffc006  #必要
END RECORD
  #161124-00048#10 add(e)
   
   DEFINE i             LIKE type_t.num5

   LET r_success = TRUE
   INITIALIZE l_sffc.* TO NULL
   
#必须有报工单资料   
   IF g_sffbdocno IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

#有录入单身资料
   IF g_sffc_d.getlength() = 0 THEN
      LET r_success = TRUE
      RETURN r_success
   END IF
   
   FOR i = 1 TO g_sffc_d.getlength()
      LET l_sffc.sffcent   = g_enterprise
      LET l_sffc.sffcsite  = g_site
      LET l_sffc.sffcdocno = g_sffbdocno
      LET l_sffc.sffcseq   = '0'
      LET l_sffc.sffc001   = g_sffc_d[i].sffc001
      LET l_sffc.sffc002   = g_sffc_d[i].sffc002
      LET l_sffc.sffc003   = g_sffc_d[i].sffc003
      LET l_sffc.sffc004   = g_sffc_d[i].sffc004
      LET l_sffc.sffc005   = g_sffc_d[i].sffc005
      LET l_sffc.sffc006   = g_sffc_d[i].sffc006

#      INSERT INTO sffc_t VALUES (l_sffc.*)      #161124-00048#10 mark
      #161124-00048#10 add(s)
      INSERT INTO sffc_t(sffcent,sffcsite,sffcdocno,sffcseq,sffc001,
                         sffc002,sffc003,sffc004,sffc005,sffc006) 
                 VALUES (l_sffc.sffcent,l_sffc.sffcsite,l_sffc.sffcdocno,l_sffc.sffcseq,l_sffc.sffc001,
                         l_sffc.sffc002,l_sffc.sffc003,l_sffc.sffc004,l_sffc.sffc005,l_sffc.sffc006)
      #161124-00048#10 add(e)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'ins sffc_t'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success 
      END IF 
   END FOR
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrp330_ins_sffd()
   DEFINE r_success     LIKE type_t.num5
#   DEFINE l_sffd        RECORD LIKE sffd_t.* #161124-00048#10 mark
   #161124-00048#10 add(s)
   DEFINE l_sffd RECORD  #報工單不良原因檔
       sffdent LIKE sffd_t.sffdent, #企业编号
       sffdsite LIKE sffd_t.sffdsite, #营运据点
       sffddocno LIKE sffd_t.sffddocno, #报工单号
       sffdseq LIKE sffd_t.sffdseq, #项次
       sffdseq1 LIKE sffd_t.sffdseq1, #项序
       sffd001 LIKE sffd_t.sffd001, #异常项目

       sffd002 LIKE sffd_t.sffd002, #数量
       sffd003 LIKE sffd_t.sffd003  #备注
END RECORD
   #161124-00048#10 add(e)
   DEFINE i             LIKE type_t.num5

   LET r_success = TRUE
   INITIALIZE l_sffd.* TO NULL
   
#必须有报工单资料   
   IF g_sffbdocno IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

#有录入单身资料
   IF g_sffd_d.getlength() = 0 THEN
      LET r_success = TRUE
      RETURN r_success
   END IF
   
   FOR i = 1 TO g_sffd_d.getlength()
      LET l_sffd.sffdent   = g_enterprise
      LET l_sffd.sffdsite  = g_site
      LET l_sffd.sffddocno = g_sffbdocno
      LET l_sffd.sffdseq   = '0'
      LET l_sffd.sffdseq1  = g_sffd_d[i].sffdseq1
      LET l_sffd.sffd001   = g_sffd_d[i].sffd001
      LET l_sffd.sffd002   = g_sffd_d[i].sffd002
      LET l_sffd.sffd003   = g_sffd_d[i].sffd003

#      INSERT INTO sffd_t VALUES (l_sffd.*)      #161124-00048#10 mark
      #161124-00048#10 add(s)
      INSERT INTO sffd_t(sffdent,sffdsite,sffddocno,sffdseq,sffdseq1,sffd001,sffd002,sffd003) 
                 VALUES (l_sffd.sffdent,l_sffd.sffdsite,l_sffd.sffddocno,l_sffd.sffdseq,l_sffd.sffdseq1,l_sffd.sffd001,l_sffd.sffd002,l_sffd.sffd003)
      #161124-00048# add(e)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'ins sffd_t'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success 
      END IF 
   END FOR
   
   RETURN r_success
END FUNCTION

#end add-point
 
{</section>}
 
