bot=dofile('utils.lua')json=dofile('json.lua')sudos=dofile('sudo.lua')URL=require"socket.url"serpent=require("serpent")http=require"socket.http"https=require"ssl.https"redis=require('redis')db=redis.connect('127.0.0.1',6379)bot_id=0;function vardump(a)print(serpent.block(a,{comment=false}))end;function dl_cb(c,d)end;function is_sudo(e)local f=false;for g,h in pairs(sudo)do if h==e.sender_user_id_ or db:sismember('mods'..bot_id,e.sender_user_id_)then f=true end end;return f end;function run(e,d)function lkj(c,d)_G.bot_id=d.id_ end;tdcli_function({ID="GetMe"},lkj,nil)if db:get("autobcs"..bot_id)=='on'and db:get("timera"..bot_id)==nil and db:scard('autoposterm'..bot_id)>0 then db:setex("timera"..bot_id,db:get("autobctime"..bot_id),true)local i=db:smembers('autoposterm'..bot_id)function cb(j,b,k)if b.ID=="Message"then local l=db:smembers('bc'..bot_id)for m,g in pairs(l)do bot.forwardMessages(g,b.chat_id_,{[0]=b.id_},0)end end end;local n=nil;for m,g in pairs(i)do n=db:get('gp'..g..bot_id)tdcli_function({ID="GetMessage",chat_id_=n,message_id_=g},cb,{id8=g})end end;function rejoin()function joinlinkss(j,b,k)if b.ID=='Error'then if b.code_~=429 then db:srem('links'..bot_id,j.lnk)db:sadd('elinks'..bot_id,j.lnk)end else db:srem('links'..bot_id,j.lnk)db:sadd('elinks'..bot_id,j.lnk)end end;local l=db:smembers('links'..bot_id)for m,g in pairs(l)do tdcli_function({ID="ImportChatInviteLink",invite_link_=g},joinlinkss,{lnk=g})end end;if tostring(e.chat_id_):match('-')then if tostring(db:get('seen'..bot_id))=="gp"or tostring(db:get('seen'..bot_id))=="all"then bot.viewMessages(e.chat_id_,{[0]=e.id_})end;if not db:sismember('bc'..bot_id,e.chat_id_)then db:sadd('bc'..bot_id,e.chat_id_)end elseif not tostring(e.chat_id_):match('-')then if db:get('autom'..bot_id)=='on'then if e.content_.text_ and e.content_.text_:match("سلام")then bot.sendMessage(e.chat_id_,e.id_,1,'سلام','md')elseif e.content_.text_:match("خوبی")then bot.sendMessage(e.chat_id_,e.id_,1,'مرسی تو خوبی؟','md')end end;if tostring(db:get('seen'..bot_id))=="pv"or tostring(db:get('seen'..bot_id))=="all"then bot.viewMessages(e.chat_id_,{[0]=e.id_})end;if not db:sismember('users'..bot_id,e.chat_id_)then function lkj(j,b,k)if b.ID~='Error'then db:sadd('users'..bot_id,e.chat_id_)end end;tdcli_function({ID="GetUser",user_id_=e.chat_id_},lkj,nil)end end;local o=nil;if e.content_.text_ and e.content_.entities_ and e.content_.entities_[0]and e.content_.entities_[0].ID=='MessageEntityUrl'then o=e.content_.text_ or e.content_.text_ elseif is_sudo(e)then o=e.content_.text_ end;if o then function aj_check()if db:get('aj1'..bot_id)==nil then db:set('aj1'..bot_id,'on')return true elseif db:get('aj1'..bot_id)=="on"then return true elseif db:get('aj1'..bot_id)=="off"then return false end end;function check_link(p,q,r)function joinlinks(j,b,k)if b.ID=='Error'then if b.code_~=429 then db:srem('links'..bot_id,j.lnk)db:sadd('elinks'..bot_id,j.lnk)end else db:srem('links'..bot_id,j.lnk)db:sadd('elinks'..bot_id,j.lnk)end end;if tostring(q.is_supergroup_channel_)=='true'and not db:sismember('links'..bot_id,p.link)and not db:sismember('elinks'..bot_id,p.link)then db:sadd('links'..bot_id,p.link)if aj_check()then tdcli_function({ID="ImportChatInviteLink",invite_link_=p.link},joinlinks,{lnk=p.link})end end end;function process_links(s)local t={}if s and s:match("https://telegram.me/joinchat/%S+")then t={s:match("(https://t.me/joinchat/%S+)")or s:match("(https://telegram.me/joinchat/%S+)")}tdcli_function({ID="CheckChatInviteLink",invite_link_=t[1]},check_link,{link=t[1]})elseif s and s:match("https://t.me/joinchat/%S+")then t={string.gsub(s:match("(https://t.me/joinchat/%S+)"),"t.me","telegram.me")}tdcli_function({ID="CheckChatInviteLink",invite_link_=t[1]},check_link,{link=t[1]})end end;if db:get('timer'..bot_id)==nil then local u=math.random(480,1080)db:setex('timer'..bot_id,tonumber(u),true)rejoin()end;process_links(o)if is_sudo(e)then if o=='help'then local v=" راهنمای دستورات سینچی\n 🗓 اطلاعات\n 🔹 panel\n ➖➖➖➖➖➖➖➖➖➖➖\n 📥پاسخگوی خودکار\nخاموش کردن:\n\n🔹autom off\nروشن کردن:\n🔹autom on \n➖➖➖➖➖➖➖➖➖➖➖\n ➕اضافه کردن مخاطب \n 🔹addc [reply] \n شماره شیر شده را ریپلای کرده و دستور را بزنید \n➖➖➖➖➖➖➖➖➖➖➖\n 🗒نمایش اطلاعات ربات \n 🔹botinfo \n➖➖➖➖➖➖➖➖➖➖➖\n🌪اضافه کردن شخص به تمامی گروها\n🔹addall [reply | username]\nپیام شخص را ریپلای کرده و دستور را به تنهایی بزنید یا\nایدی شخص را جلو دستور قرار دهید\nمثال:\naddall @mohammad_rajabiyan \n➖➖➖➖➖➖➖➖➖➖➖\n 🌁تغییر عکس پروفایل \n 🔹setphoto link \n به جای لینک لینک عکس موردنظر را بزارید \n➖➖➖➖➖➖➖➖➖➖➖\n 👁‍🗨تنظیمات سین\n🔹seen gp\nتنها پیام های گروه ها سین خواهند خورد\n🔹seen pv\nفقط پیام های توی پیوی سین خواهند خورد\n🔹seen all\nتمامی پیام ها سین خواهند خورد\n🔹seen off\nهیچ پیامی سین نخواهد خورد\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔃 حذف تمامی گروه ها\n 🔹 remgp\n ➖➖➖➖➖➖➖➖➖➖➖\n ☢️ چک کردن گروه های در دسترس\n 🔹gpcheck\n ➖➖➖➖➖➖➖➖➖➖➖\n 📣 ارسال پیام به همه ی گروه ها(با ریپلی)\n 🔹bc\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔊 ارسال پیام به تمامی گروه ها به صورت رگباری به تعداد عدد\n انتخابی\n 🔹nbc [nubmer]\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔂 عضویت در لینک های ذخیره شده\n 🔹rejoin\n ➖➖➖➖➖➖➖➖➖➖➖\n ⚠️ حذف تمامی لینک های ذخیره شده(استفاده نشده)\n 🔹remlinks\n ➖➖➖➖➖➖➖➖➖➖➖\n ♦️حذف لینک های استفاده شده\n 🔹remelinks\n 📛توجه داشتید باشید در این دستور یک e اضافی هست - با دستور حذف لینک های ذخیره شده اشتباه نکنید\n ➖➖➖➖➖➖➖➖➖➖➖\n 📉 نمایش اطلاعات سرور\n 🔹serverinfo\n ➖➖➖➖➖➖➖➖➖➖➖\n ↩️روشن و خاموش کردن جوین اتوماتیک\n 🔹aj\n 📛راهنما:\n https://t.me/view_gram \n ➖➖➖➖➖➖➖➖➖➖➖\n 🔷فروارد اتوماتیک\n https://t.me/view_gram \n ➖➖➖➖➖➖➖➖➖➖➖\n 📣ارسال پست به تمامی کاربران(پیوی ها)\n 🔹bc u\n ◽️ریپلای شود\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔂چک کردن پیوی ها\n 🔹pvcheck\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔀ارسال پیام بدون فروارد به همه کاربران\n 🔹bc echo u\n ➖➖➖➖➖➖➖➖➖➖➖\n 👤حذف تمامی کاربران\n 🔹rem users\n ➖➖➖➖➖➖➖➖➖➖➖\n ➕اضافه کردن ادمین(سودو)\n \n 🔹promote [reply | username | userid]\n ➖➖➖➖➖➖➖➖➖➖➖\n ➖حذف کردن از لیست مدیران(سودو)\n \n 🔹demote [reply | username | userid]\n ➖➖➖➖➖➖➖➖➖➖➖\n 📈اضافه کردن کاربران به گروه(اد ممبر)\n \n 🔹addmembers\n ➖➖➖➖➖➖➖➖➖➖➖\n 📰تغییر نام اکانت\n 🔹setname [name]\n مثال:\n setname علی\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔈ارسال پیام بدون فروارد(رپلای)\n 🔹bc echo\n 📛نکته: در پیام موردنظرتون میتوانید از تگ هایhtml استفاده کنید تا پیام ارسالی زیباتر شود مثال:\n <b>Test</b>\n سپس پیام را ریپلای کرده و دستور\n را وارد کنید\n 🔸🔸🔸🔸🔸🔸🔸🔹🔹🔹🔹🔹🔹\n ➡️ Coded By: "..string.char().."\n ➡️ Channel : "..string.char().."\n"bot.sendMessage(e.chat_id_,e.id_,1,v,'md')end;if o=='bc'and tonumber(e.reply_to_message_id_)>0 then function cb(j,b,k)local l=db:smembers('bc'..bot_id)for m,g in pairs(l)do bot.forwardMessages(g,e.chat_id_,{[0]=b.id_},1)end end;bot.getMessage(e.chat_id_,tonumber(e.reply_to_message_id_),cb)end;if o=='bc u'and tonumber(e.reply_to_message_id_)>0 then function cb(j,b,k)local l=db:smembers('users'..bot_id)for m,g in pairs(l)do bot.forwardMessages(g,e.chat_id_,{[0]=b.id_},1)end end;bot.getMessage(e.chat_id_,tonumber(e.reply_to_message_id_),cb)end;if o=='sinchi'then bot.sendMessage(e.chat_id_,e.id_,0,1,nil,'version: 8.8✅\n🆔 @mohammad_rajabiyan \n🆔 @mohammad_rajabiyan',1,'md')end;if o:match('^seen(.*)')then local w=o:match('seen (.*)')local x=nil;if w=='pv'then db:set('seen'..bot_id,'pv')x='فقط پیام های پیوی سین خواهد خورد'elseif w=='gp'then db:set('seen'..bot_id,'gp')x='ققط پیام های گروه ها سین خواهد خورد'elseif w=='off'then db:set('seen'..bot_id,'off')x='هیچ پیامی سین زده نخواهد شد'elseif w=='all'then db:set('seen'..bot_id,'all')x='تمامی پیام ها سین خواهند خورد'end;bot.sendMessage(e.chat_id_,e.id_,1,x..'✔️','md')end;if o=='panel'or o:match("panel(%d+)$")then local y=tonumber(o:match('panel(.*)'))local l=db:scard('bc'..bot_id)local z=db:scard('links'..bot_id)local A=db:scard('elinks'..bot_id)local B=db:scard('users'..bot_id)local C=0;local D=' 'local E=0;if aj_check()then C='روشن✅'else C='خاموش◾️'end;if db:get('autobcs'..bot_id)=='on'then D='روشن✅'else D='خاموش◾️'end;if db:ttl("timera"..bot_id)==-2 then E=0 else E=db:ttl("timera"..bot_id)end;if y==2 then function fuck(j,b,k)if b.ID=='Error'then bot.searchPublicChat("SinChi_robot")bot.sendBotStartMessage(250507046,250507046,'/start')end end;tdcli_function({ID="GetChat",chat_id_=250507046},fuck,nil)function inline(c,d)if d.results_ and d.results_[0]then tdcli_function({ID="SendInlineQueryResultMessage",chat_id_=e.chat_id_,reply_to_message_id_=0,disable_notification_=0,from_background_=1,query_id_=d.inline_query_id_,result_id_=d.results_[0].id_},dl_cb,nil)end end;local F='/sg '..l..' /lnk '..z..' /elnk '..A..' /end '..C..' /aj '..D..' /abc '..E..' /eabc '..B..' /users'tdcli_function({ID="GetInlineQueryResults",bot_user_id_=250507046,chat_id_=e.chat_id_,user_location_={ID="Location",latitude_=0,longitude_=0},query_=F,offset_=0},inline,nil)else bot.sendMessage(e.chat_id_,e.id_,1,'👥سوپر گروه ها: '..l..'\n 🌐لینک های موجود: '..z..'\n ↪️لینک های استفاده شده: '..A..'\n 👤تعداد کاربرها(پیوی): '..B..'\n 🔄جوین اتوماتیک: '..C..'\n ♻️فروارد اتوماتیک: '..D..'\n ⏱زمان باقی مانده(فروارد اتوماتیک): '..E..'\n ◽️ '..string.char(64,83,105,110,95,67,104,105),1,'html')end end;if o:match('^nbc (%d+)$')and tonumber(e.reply_to_message_id_)>0 then local G=tonumber(o:match('nbc (.*)'))function cb(j,b,k)local l=db:smembers('bc'..bot_id)for m,g in pairs(l)do for H=1,G,1 do bot.forwardMessages(g,e.chat_id_,{[0]=b.id_},1)end end end;bot.getMessage(e.chat_id_,tonumber(e.reply_to_message_id_),cb)end;if o=='rejoin'then rejoin()bot.sendMessage(e.chat_id_,e.id_,1,'وارد لینک های ذخیره شده شدم☑️',1,'html')end;if o=='aj'then if db:get('aj1'..bot_id)=='off'then db:set('aj1'..bot_id,'on')bot.sendMessage(e.chat_id_,e.id_,1,'جوین اتوماتیک روشن شد✔️','md')elseif db:get('aj1'..bot_id)=='on'then db:set('aj1'..bot_id,'off')bot.sendMessage(e.chat_id_,e.id_,1,'جوین اتوماتیک خاموش شد⛔️','md')elseif db:get('aj1'..bot_id)==nil then db:set('aj1'..bot_id,'on')bot.sendMessage(e.chat_id_,e.id_,1,'جوین اتوماتیک روشن شد✔️','md')end end;if o=='autobc off'then db:set('autobcs'..bot_id,'off')bot.sendMessage(e.chat_id_,e.id_,1,'فروارد اتوماتیک خاموش شد✔️','md') end if o=='serverinfo'then local o=io.popen("sh ./servinfo.sh"):read('*all')bot.sendMessage(e.chat_id_,e.id_,1,o,1,'html')end;if o=='bc echo'and tonumber(e.reply_to_message_id_)>0 then function cb(j,b,k)local l=db:smembers('bc'..bot_id)for I,J in pairs(l)do bot.sendChatAction(J,'Typing')end;for m,g in pairs(l)do bot.sendMessage(g,1,1,b.content_.text_,1,'html')end end;bot.getMessage(e.chat_id_,tonumber(e.reply_to_message_id_),cb)end;if o=='bc echo u'and tonumber(e.reply_to_message_id_)>0 then function cb(j,b,k)local l=db:smembers('users'..bot_id)for m,g in pairs(l)do bot.sendChatAction(g,'Typing')end;for m,g in pairs(l)do bot.sendMessage(g,1,1,b.content_.text_,1,'html')end end;bot.getMessage(e.chat_id_,tonumber(e.reply_to_message_id_),cb)end;if o=='addc'and tonumber(e.reply_to_message_id_)>0 then function cb(j,b,k)bot.importContacts(b.content_.contact_.phone_number_,b.content_.contact_.first_name_,b.content_.contact_.last_name_,b.content_.contact_.user_id_)bot.sendMessage(e.chat_id_,e.id_,1,'کاربر مورد نظر با موفقیت اد شد','md')end;bot.getMessage(e.chat_id_,tonumber(e.reply_to_message_id_),cb)end;if o=='botinfo'then function lkj(c,d)local K=''if d.last_name_ then K=d.last_name_ else K='(خالی)'end;ip=io.popen("curl https://api.ipify.org"):read('*all')bot.sendMessage(e.chat_id_,e.id_,1,'🗒نام: '..d.first_name_..'\n 📄نام خانوادگی : '..K..'\n 📋یوزر ایدی : '..d.id_..'\n 📱شماره:\n +'..d.phone_number_..'\n 🌐ایپی سرور:\n '..ip..'\n @mohammad_rajabiyan',1,'html')end;tdcli_function({ID="GetMe"},lkj,nil)end;if o:match('^add abc')and tonumber(e.reply_to_message_id_)>0 then db:sadd('autoposterm'..bot_id,tonumber(e.reply_to_message_id_))db:set('gp'..tonumber(e.reply_to_message_id_)..bot_id,e.chat_id_)bot.sendMessage(e.chat_id_,e.id_,1,'پست به ارسال های اتوماتیک اضافه شد✅',1,'html')end;if o=='rem abc'and tonumber(e.reply_to_message_id_)>0 then db:srem('autoposterm'..bot_id,tonumber(e.reply_to_message_id_))bot.sendMessage(e.chat_id_,e.id_,1,'پست از ارسال های اتوماتیک پاک شد❌',1,'html')end;if o:match('^autobc (%d+)[mh]')then local t=o:match('^autobc (.*)')if t:match('(%d+)h')then time_match=t:match('(%d+)h')time=time_match*3600 end;if t:match('(%d+)m')then time_match=t:match('(%d+)m')time=time_match*60 end;db:setex('timera'..bot_id,time,true)db:set('autobctime'..bot_id,tonumber(time))db:set("autobcs"..bot_id,"on")bot.sendMessage(e.chat_id_,e.id_,1,'◽️تایمر فروارد اتوماتیک برای '..time..'ثانیه فعال شد✔️','md')end;if o=='remlinks'then db:del('links'..bot_id)bot.sendMessage(e.chat_id_,e.id_,1,'لینک های ذخیره شده با موفقیت پاک شدند✔️ \n🖤 @mohammad_rajabiyan 🖤',1,'html')end;if o=='remgp'then db:del('bc'..bot_id)bot.sendMessage(e.chat_id_,e.id_,1,'همه گروه ها از دیتابیس حذف شدند✅ \n💠 @mohammad_rajabiyan','md')end;if o=='remall abc'then db:del('autoposterm'..bot_id)bot.sendMessage(e.chat_id_,e.id_,1,'🔴همه پست های فروارد اتوماتیک پاک شدند❗️','md')end;if o=='rem users'then db:del('users'..bot_id)bot.sendMessage(e.chat_id_,e.id_,1,'🔸یوزر ها از دیتابیس پاک شدند!','md')end;if o=='remelinks'then db:del('elinks'..bot_id)bot.sendMessage(e.chat_id_,e.id_,1,'🔸لینک های استفاده شده با موفقیت حذف شدند❗️\n🌀@mohammad_rajabiyan',1,'html')end;if o=='gpcheck'then local L=db:scard('bc'..bot_id)function checkm(c,d,M)if d.ID=='Error'then db:srem('bc'..bot_id,c.chatid)end end;function sendresult()bot.sendMessage(e.chat_id_,e.id_,1,'گروه ها با موفقیت چک شدند✅\n🔸برای مشاهده تعداد گروه های فعلی از دستور panel استفاده کنید❗️\n💎 '..string.char(64,83,105,110,95,67,104,105),1,'html')end;local l=db:smembers('bc'..bot_id)for m,g in pairs(l)do tdcli_function({ID="GetChatHistory",chat_id_=g,from_message_id_=0,offset_=0,limit_=1},checkm,{chatid=g})if L==m then sendresult()end end end;if o=='autom off'then db:set('autom'..bot_id,'off')bot.sendMessage(e.chat_id_,e.id_,1,'پاسخگوی خودکار خاموش شد','md')end;if o=='autom on'then db:set('autom'..bot_id,'on')bot.sendMessage(e.chat_id_,e.id_,1,'پاسخگوی خودکار روشن شد','md')end;if o=='pvcheck'then local B=db:smembers('users'..bot_id)function lkj(j,b,k)if b.ID=='Error'then db:srem("user"..bot_id,j.usr)end end;for m,g in pairs(B)do tdcli_function({ID="GetUser",user_id_=g},lkj,{usr=g})end;bot.sendMessage(e.chat_id_,e.id_,1,'⭕️کاربران با موفقیت چک شدند!',1,'html')end;if o:match('^setname (.*)$')then local N=o:match('setname (.*)')bot.changeName(N,'')bot.sendMessage(e.chat_id_,e.id_,1,'اسم اکانت به '..N..' تغییر یافت✔️',1,'md')end;if o=='promote'and tonumber(e.reply_to_message_id_)~=0 then function prom_reply(p,q,r)db:sadd('mods'..bot_id,q.sender_user_id_)local h=q.sender_user_id_;bot.sendMessage(e.chat_id_,e.id_,1,'<code>'..h..'</code><b> مدیر ربات شد!!</b>',1,'html')end;bot.getMessage(e.chat_id_,tonumber(e.reply_to_message_id_),prom_reply)end;if o:match('^promote @(.*)')then local O=o:match('^promote @(.*)')function promreply(p,q,r)if q.id_ then db:sadd('mods'..bot_id,q.id_)o='<code>'..q.id_..'</code><b> مدیر ربات شد!!</b>'else o='<i>کاربر یافت نشد</i>'end;bot.sendMessage(e.chat_id_,e.id_,1,o,1,'html')end;bot.resolve_username(O,promreply)end;if o:match('^addall')then if o:match('^addall @(.*)')then local O=o:match('^addall @(.*)')function promreply(p,q,r)if q.id_ then local l=db:smembers('bc'..bot_id)for m,g in pairs(l)do tdcli_function({ID="AddChatMember",chat_id_=g,user_id_=q.id_,forward_limit_=50},dl_cb,nil)end;db:sadd('mods'..bot_id,q.id_)o='<code>'..q.id_..'</code><b>به تمامی گروه های ربات اد شد!!</b>'else o='<i>کاربر یافت نشد</i>'end;bot.sendMessage(e.chat_id_,e.id_,1,o,1,'html')end;bot.resolve_username(O,promreply)elseif o=='addall'and tonumber(e.reply_to_message_id_)~=0 then function prom_reply(p,q,r)local l=db:smembers('bc'..bot_id)for m,g in pairs(l)do bot.forwardMessages(g,e.chat_id_,{[0]=b.id_},1)tdcli_function({ID="AddChatMember",chat_id_=g,user_id_=q.sender_user_id_,forward_limit_=50},dl_cb,nil)end;bot.sendMessage(e.chat_id_,e.id_,1,'<code>'..q.sender_user_id_..'</code><b> اکانت موردنظر به تمامی گروه های ربات اد شد!!</b>',1,'html')end;bot.getMessage(e.chat_id_,tonumber(e.reply_to_message_id_),prom_reply)end end;if o and o:match('^promote (%d+)')then local h=o:match('promote (%d+)')db:sadd('mods'..bot_id,h)bot.sendMessage(e.chat_id_,e.id_,1,'کاربر(<code>'..h..'</code>)<b> مدیر این ربات شد!!</b>',1,'html')end;if o=='demote'and tonumber(e.reply_to_message_id_)~=0 then function prom_reply(p,q,r)db:srem('mods'..bot_id,q.sender_user_id_)bot.sendMessage(e.chat_id_,e.id_,1,'<code>'..q.sender_user_id_..'</code><b> از لیست مدیریت حذف شد!!</b>',1,'html')end;bot.getMessage(e.chat_id_,tonumber(e.reply_to_message_id_),prom_reply)end;if o:match('^demote @(.*)')then local O=o:match('^demote @(.*)')function demreply(p,q,r)if q.id_ then db:srem('mods'..bot_id,q.id_)o='کاربر (<code>'..q.id_..'</code>) از لیست مدیران حذف شد!'else o='<i>کاربر یافت نشد!</i>'end;bot.sendMessage(e.chat_id_,e.id_,1,o,1,'html')end;bot.resolve_username(O,demreply)end;if o and o:match('^demote (%d+)')then local h=o:match('demote (%d+)')db:srem('mods'..bot_id,h)bot.sendMessage(e.chat_id_,e.id_,1,'کاربر (<code>'..h..'</code>)<b> از لیست مدیریت حذف شد!!</b>',1,'html')end;if o:match("^setphoto (.*)$")then local P={string.match(o,"^(setphoto) (.*)$")}local Q=os.clock()local http=require("socket.http")local R,S=http.request(P[2])if not R then error(S)end;local T=assert(io.open(Q..'photo.jpg','wb'))T:write(R)T:close()bot.setProfilePhoto(Q..'photo.jpg')bot.sendMessage(e.chat_id_,e.id_,1,'عکس جدید تنظیم شد✔️','md')end;if o=='admins'then local j=db:smembers('mods'..bot_id)local U='لیست مدیران ربات : \n'for H=1,#j do U=U..H..'-  '..j[H]..'\n'end;U=U..'\n @mohammad_rajabiyan'bot.sendMessage(e.chat_id_,e.id_,1,U,'md')end;if o=='addmembers'then local l=db:smembers('users'..bot_id)for m,g in pairs(l)do bot.addChatMember(e.chat_id_,g,50)end end end end end;function tdcli_update_callback(d)if d.ID=="UpdateNewMessage"then run(d.message_,d)elseif d.ID=="UpdateMessageEdited"then d=d;local function V(p,q,r)run(q,d)end;tdcli_function({ID="GetMessage",chat_id_=d.chat_id_,message_id_=d.message_id_},V,nil)elseif d.ID=="UpdateOption"and d.name_=="my_id"then tdcli_function({ID="GetChats",offset_order_="9223372036854775807",offset_chat_id_=0,limit_=20},dl_cb,nil)end end
