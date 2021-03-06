#該程式未解開Section, 採用最新樣板產出!
{<section id="asrr351_x02.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:1(2015-01-16 17:34:37), PR版次:0001(2015-01-16 18:04:01)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000048
#+ Filename...: asrr351_x02
#+ Description: ...
#+ Creator....: 05423(2015-01-16 17:22:10)
#+ Modifier...: 05423 -SD/PR- 05423
 
{</section>}
 
{<section id="asrr351_x02.global" readonly="Y" >}
#報表 x01 樣板自動產生(Version:8)
#add-point:填寫註解說明 name="global.memo"

#end add-point
#add-point:填寫註解說明 name="global.memo_customerization"

#end add-point
 
IMPORT os
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_report.inc"                  #報表使用的global
 
#報表 type 宣告
DEFINE tm RECORD
       wc STRING                   #where condition
       END RECORD
 
DEFINE g_str           STRING,                      #列印條件回傳值              
       g_sql           STRING  
 
#add-point:自定義環境變數(Global Variable)(客製用) name="global.variable_customerization"

#end add-point
#add-point:自定義環境變數(Global Variable)(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="asrr351_x02.main" readonly="Y" >}
PUBLIC FUNCTION asrr351_x02(p_arg1)
DEFINE  p_arg1 STRING                  #tm.wc  where condition
#add-point:init段define(客製用) name="component.define_customerization"

#end add-point
#add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="component.define"

#end add-point
 
   LET tm.wc = p_arg1
 
   #add-point:報表元件參數準備 name="component.arg.prep"
   
   #end add-point
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   ##報表元件執行期間是否有錯誤代碼
   LET g_rep_success = 'Y'
   
   #報表元件代號      
   LET g_rep_code = "asrr351_x02"
   IF cl_null(tm.wc) THEN LET tm.wc = " 1=1" END IF
 
   #create 暫存檔
   CALL asrr351_x02_create_tmptable()
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF
   #報表select欄位準備
   CALL asrr351_x02_sel_prep()
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
   #報表insert的prepare
   CALL asrr351_x02_ins_prep()  
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF
   #將資料存入tmptable
   CALL asrr351_x02_ins_data() 
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
   #將tmptable資料印出
   CALL asrr351_x02_rep_data()
 
END FUNCTION
 
{</section>}
 
{<section id="asrr351_x02.create_tmptable" readonly="Y" >}
PRIVATE FUNCTION asrr351_x02_create_tmptable()
 
   #清除temptable 陣列
   CALL g_rep_tmpname.clear()
   
   #可切換資料庫，避免大量資料佔資源及空間
   #add-point:create_tmp.before name="create_tmp.before"
   
   #end add-point:create_tmp.before
 
   #主報表TEMP TABLE的欄位SQL   
   LET g_sql = "srbadocno.srba_t.srbadocno,srbadocdt.srba_t.srbadocdt,l_srba001_srba002.type_t.chr50,l_srba003_desc.type_t.chr50,l_srba004_desc.gzcbl_t.gzcbl004,l_srba005_desc.inayl_t.inayl003,l_srba006_desc.inab_t.inab003,srbb001.srbb_t.srbb001,imaal_t_imaal003.imaal_t.imaal003,imaal_t_imaal004.imaal_t.imaal004,srbb002.srbb_t.srbb002,srbb005.srbb_t.srbb005,srbb006.srbb_t.srbb006,srbb007.srbb_t.srbb007,srbb008.srbb_t.srbb008,srbb009.srbb_t.srbb009,l_num.srbb_t.srbb008" 
   
   #建立TEMP TABLE,主報表序號1 
   IF NOT cl_xg_create_tmptable(g_sql,1) THEN
      LET g_rep_success = 'N'            
   END IF
   #可切換資料庫，避免大量資料佔資源及空間
   #add-point:create_tmp.after name="create_tmp.after"
   
   #end add-point:create_tmp.after
END FUNCTION
 
{</section>}
 
{<section id="asrr351_x02.ins_prep" readonly="Y" >}
PRIVATE FUNCTION asrr351_x02_ins_prep()
DEFINE i              INTEGER
DEFINE l_prep_str     STRING
#add-point:ins_prep.define (客製用) name="ins_prep.define_customerization"

#end add-point:ins_prep.define
#add-point:ins_prep.define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_prep.define"

#end add-point:ins_prep.define
 
   FOR i = 1 TO g_rep_tmpname.getLength()
      CALL cl_xg_del_data(g_rep_tmpname[i])
      #LET g_sql = g_rep_ins_prep[i]              #透過此lib取得prepare字串 lib精簡
      CASE i
         WHEN 1
         #INSERT INTO PREP
         LET g_sql = " INSERT INTO ",g_rep_db CLIPPED,g_rep_tmpname[1] CLIPPED," VALUES(?,?,?,?,?,?, 
             ?,?,?,?,?,?,?,?,?,?,?)"
         PREPARE insert_prep FROM g_sql
         IF STATUS THEN
            LET l_prep_str ="insert_prep",i
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_prep_str
            LET g_errparam.code   = status
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            CALL cl_xg_drop_tmptable()
            LET g_rep_success = 'N'           
         END IF 
         #add-point:insert_prep段 name="insert_prep"
         
         #end add-point                  
 
 
      END CASE
   END FOR
END FUNCTION
 
{</section>}
 
{<section id="asrr351_x02.sel_prep" readonly="Y" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION asrr351_x02_sel_prep()
DEFINE g_select      STRING
DEFINE g_from        STRING
DEFINE g_where       STRING
#add-point:sel_prep段define(客製用) name="sel_prep.define_customerization"

#end add-point
#add-point:sel_prep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sel_prep.define"

#end add-point
 
   #add-point:sel_prep before name="sel_prep.before"
   
   #end add-point
 
   #add-point:sel_prep g_select name="sel_prep.g_select"
   LET g_select = " SELECT DISTINCT srbadocno,srbadocdt,srba001,srba002,trim(srba001)||'~'||trim(srba002),srba003, 
       trim(srba003)||'.'||trim(srza002),srba004,NULL,srba005,(trim(srba005)||'.'||trim(inayl003)),srba006,",
       "(trim(srba006)||'.'||trim(inab003)),srbb001,imaal_t.imaal003,imaal_t.imaal004,srbb002,srbb005,srbb006,",
       "srbb007,srbb008,srbb009,(srbb008-srbb009)"
#   #end add-point
#   LET g_select = " SELECT srbadocno,srbadocdt,srba001,srba002,trim(srba001)||'~'||trim(srba002),srba003, 
#       NULL,srba004,NULL,srba005,NULL,srba006,NULL,srbb001,imaal_t.imaal003,imaal_t.imaal004,srbb002, 
#       srbb005,srbb006,srbb007,srbb008,srbb009,NULL"
# 
#   #add-point:sel_prep g_from name="sel_prep.g_from"
    LET g_from = " FROM srba_t LEFT OUTER JOIN srbb_t ON srbadocno = srbbdocno AND srbaent = srbbent AND srbasite = srbbsite ",
                 "             LEFT OUTER JOIN srza_t ON srba003 = srza001 AND srbaent = srzaent AND srbasite = srzasite ",
                 "             LEFT OUTER JOIN inab_t ON srba005 = inab001 AND srba006 = inab002 AND srbasite = inabsite AND srbaent = inabent ",
                 "             LEFT OUTER JOIN inayl_t ON srba005 = inayl001 AND srbaent = inaylent AND inayl002 = '",g_dlang,"' ",
                 "             LEFT OUTER JOIN imaal_t ON srbb001 = imaal001 AND srbbent = imaalent AND imaal002 = '",g_dlang,"' "
#   #end add-point
#    LET g_from = " FROM srba_t,srbb_t,imaal_t"
# 
#   #add-point:sel_prep g_where name="sel_prep.g_where"
   
   #end add-point
    LET g_where = " WHERE " ,tm.wc CLIPPED
 
   #add-point:sel_prep g_order name="sel_prep.g_order"
   
   #end add-point
 
   #add-point:sel_prep.sql.before name="sel_prep.sql.before"
   
   #end add-point:sel_prep.sql.before
   LET g_where = g_where ,cl_sql_add_filter("srba_t")   #資料過濾功能
   LET g_sql = g_select CLIPPED ," ",g_from CLIPPED ," ",g_where CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段
 
   #add-point:sel_prep.sql.after name="sel_prep.sql.after"
   
   #end add-point
   PREPARE asrr351_x02_prepare FROM g_sql
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'prepare:'
      LET g_errparam.code   = STATUS
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET g_rep_success = 'N' 
   END IF
   DECLARE asrr351_x02_curs CURSOR FOR asrr351_x02_prepare
 
END FUNCTION
 
{</section>}
 
{<section id="asrr351_x02.ins_data" readonly="Y" >}
PRIVATE FUNCTION asrr351_x02_ins_data()
DEFINE sr RECORD 
   srbadocno LIKE srba_t.srbadocno, 
   srbadocdt LIKE srba_t.srbadocdt, 
   srba001 LIKE srba_t.srba001, 
   srba002 LIKE srba_t.srba002, 
   l_srba001_srba002 LIKE type_t.chr50, 
   srba003 LIKE srba_t.srba003, 
   l_srba003_desc LIKE type_t.chr50, 
   srba004 LIKE srba_t.srba004, 
   l_srba004_desc LIKE gzcbl_t.gzcbl004, 
   srba005 LIKE srba_t.srba005, 
   l_srba005_desc LIKE inayl_t.inayl003, 
   srba006 LIKE srba_t.srba006, 
   l_srba006_desc LIKE inab_t.inab003, 
   srbb001 LIKE srbb_t.srbb001, 
   imaal_t_imaal003 LIKE imaal_t.imaal003, 
   imaal_t_imaal004 LIKE imaal_t.imaal004, 
   srbb002 LIKE srbb_t.srbb002, 
   srbb005 LIKE srbb_t.srbb005, 
   srbb006 LIKE srbb_t.srbb006, 
   srbb007 LIKE srbb_t.srbb007, 
   srbb008 LIKE srbb_t.srbb008, 
   srbb009 LIKE srbb_t.srbb009, 
   l_num LIKE srbb_t.srbb008
 END RECORD
#add-point:ins_data段define (客製用) name="ins_data.define_customerization"

#end add-point
#add-point:ins_data段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_data.define"

#end add-point
 
    #add-point:ins_data段before name="ins_data.before"
    
    #end add-point
 
    LET g_rep_success = 'Y'
 
    FOREACH asrr351_x02_curs INTO sr.*                               
       IF STATUS THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = 'foreach:'
          LET g_errparam.code   = STATUS
          LET g_errparam.popup  = TRUE
          CALL cl_err()
          LET g_rep_success = 'N'
          EXIT FOREACH
       END IF
 
       #add-point:ins_data段foreach name="ins_data.foreach"
       #分攤方式
       IF NOT cl_null(sr.srba004) THEN 
         CALL asrr351_x02_desc('5401',sr.srba004) RETURNING sr.l_srba004_desc
         LET sr.l_srba004_desc = sr.srba004 CLIPPED,'.',sr.l_srba004_desc
       END IF
       #生產計劃
       IF sr.l_srba003_desc = '.' THEN
         LET sr.l_srba003_desc = NULL
       END IF
       #庫位
       IF sr.l_srba005_desc = '.' THEN
         LET sr.l_srba005_desc = NULL
       END IF
       #儲位
       IF sr.l_srba006_desc = '.' THEN
         LET sr.l_srba006_desc = NULL
       END IF
       #end add-point
 
       #add-point:ins_data段before.save name="ins_data.before.save"
       
       #end add-point
 
       #EXECUTE
       EXECUTE insert_prep USING sr.srbadocno,sr.srbadocdt,sr.l_srba001_srba002,sr.l_srba003_desc,sr.l_srba004_desc,sr.l_srba005_desc,sr.l_srba006_desc,sr.srbb001,sr.imaal_t_imaal003,sr.imaal_t_imaal004,sr.srbb002,sr.srbb005,sr.srbb006,sr.srbb007,sr.srbb008,sr.srbb009,sr.l_num
 
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = "asrr351_x02_execute"
          LET g_errparam.code   = SQLCA.sqlcode
          LET g_errparam.popup  = FALSE
          CALL cl_err()       
          LET g_rep_success = 'N'
          EXIT FOREACH
       END IF
 
       #add-point:ins_data段after_save name="ins_data.after.save"
       
       #end add-point
       
    END FOREACH
    
    #add-point:ins_data段after name="ins_data.after"
    
    #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="asrr351_x02.rep_data" readonly="Y" >}
PRIVATE FUNCTION asrr351_x02_rep_data()
#add-point:rep_data.define (客製用) name="rep_data.define_customerization"

#end add-point:rep_data.define
#add-point:rep_data.define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="rep_data.define"

#end add-point:rep_data.define
 
    #add-point:rep_data.before name="rep_data.before"
    
    #end add-point:rep_data.before
    
    CALL cl_xg_view()
    #add-point:rep_data.after name="rep_data.after"
    
    #end add-point:rep_data.after
END FUNCTION
 
{</section>}
 
{<section id="asrr351_x02.other_function" readonly="Y" >}

#GET DESC
PRIVATE FUNCTION asrr351_x02_desc(p_num,p_target)
   DEFINE p_num    LIKE type_t.num5
   DEFINE p_target LIKE type_t.chr10
   DEFINE r_desc   LIKE type_t.chr500

      SELECT gzcbl004 INTO r_desc
        FROM gzcbl_t
       WHERE gzcbl001 = p_num
         AND gzcbl002 = p_target
         AND gzcbl003 = g_dlang

   RETURN r_desc 
END FUNCTION

 
{</section>}
 
