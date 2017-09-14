.z.pw:{[u;p]"b"$not count .z.W}

/ update default seed
system"S ",string`int$.z.t;

/Powered by News API
/default BBC
news_key:first@[read0;`:news_key;""];
src:(),hsym`$"http://newsapi.org/v1/articles?source=",/:@[read0;`:sources.txt;enlist"bbc-news&sortBy=top"],\:"&apiKey=",news_key;

getheadline:{news:.j.k .Q.hg first 1?src;
  neg[.z.w](`worker;`news;raze"(",x,") "," - "sv(),/:"c"$enlist[news`source],first each?[1;news`articles]`title`description`url)}

/ last fm analysis
.lfm.key:first@[read0;`:lfm_key;""];
.lfm.req:{.j.k .Q.hg`$"http://ws.audioscrobbler.com/2.0/?format=json&api_key=",.lfm.key,"&method=user.getrecenttracks&user=",x};
.lfm.nowPlaying:{[x;y;z]                                                                        / [user;lfm name;msg]
  msg:.lfm.req y;
  if[`error in key msg;:()];                                                                    / error
  if[0=count m:msg[`recenttracks]`track;:()];                                                   / no recent tracks
  if[not(`$"@attr")in key a:first m;:()];                                                       / not listening
  s:"'",a[`name],"' by ",a[`artist]`$"#text";
  :neg[.z.w](`worker;`music;"Hey ",x,", ",z," is listening to ",s);
 };

/ bitcoin
.btc.getprice:{
 j:.j.k .Q.hg`$":http://api.coindesk.com/v1/bpi/currentprice.json";
 d:`GBP`USD`EUR!("£";"$";"€");
 :neg[.z.w](`worker;`bitcoin;"Hey ",x,", bitcoin price is currently: ",d[y],j[`bpi][y][`rate]," (",string[y],")");
 }
