<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>CVS log for src/common/lib/libutil/snprintb.c</title>
<meta name="robots" content="nofollow">
<meta name="generator" content="FreeBSD-CVSweb 2.0.6">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
</head>
<body text="#000000" bgcolor="#ffffff">
<a href="http://www.netbsd.org/"><img src="/images/powered-by-NetBSD.png" alt="The NetBSD Project" border="0"></a> <h1 align="center">CVS log for src/common/lib/libutil/snprintb.c</h1>
<p>
 <a href="/bsdweb.cgi/src/common/lib/libutil/#snprintb.c"><img src="/icons/back.gif" alt="[BACK]" border="0" width="20" height="22"></a> <b>Up to  <a href="/bsdweb.cgi/#dirlist">[cvs.netbsd.org]</a> / <a href="/bsdweb.cgi/src/#dirlist">src</a> / <a href="/bsdweb.cgi/src/common/#dirlist">common</a> / <a href="/bsdweb.cgi/src/common/lib/#dirlist">lib</a> / <a href="/bsdweb.cgi/src/common/lib/libutil/#dirlist">libutil</a></b>
</p>
<p>
 <a href="#diff">Request diff between arbitrary revisions</a>
</p>
<hr noshade>
<p>
Default branch: MAIN<br>
</p>
<hr size="1" noshade>
<p>
<a name="rev1.4.2.1"></a><a name="jym-xensuspend"></a>
 Revision <a href="snprintb.c?rev=1.4.2.1&amp;content-type=text/x-cvsweb-markup"><b>1.4.2.1</b></a> / (<a href="/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.4.2.1&amp;content-type=text/plain" target="cvs_checkout" onclick="window.open('/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.4.2.1&amp;content-type=text/plain','cvs_checkout','resizable,scrollbars');return false"><b>download</b></a>) - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?annotate=1.4.2.1">annotate</a> - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?r1=1.4.2.1">[select for diffs]</a>, <i>Wed May 13 17:23:18 2009 UTC</i> (12 months, 3 weeks ago) by <i>jym</i>
<br>Branch: <b><a href="./snprintb.c?only_with_tag=jym-xensuspend">jym-xensuspend</a>
</b>
<br>Changes since <b>1.4: +126 -37
 lines</b><br>Diff to previous <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.4&amp;r2=1.4.2.1">1.4</a> (<a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.4&amp;r2=1.4.2.1&amp;f=h">colored</a>) next main <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.5&amp;r2=1.4.2.1">1.5</a> (<a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.5&amp;r2=1.4.2.1&amp;f=h">colored</a>)
</p>
<pre>
Sync with HEAD.

Commit is split, to avoid a &quot;too many arguments&quot; protocol error.
</pre>
<hr size="1" noshade>
<p>
<a name="rev1.5"></a><a name="yamt-nfs-mp-base9"></a><a name="yamt-nfs-mp-base8"></a><a name="yamt-nfs-mp-base7"></a><a name="yamt-nfs-mp-base6"></a><a name="yamt-nfs-mp-base5"></a><a name="yamt-nfs-mp-base4"></a><a name="rmind-uvmplock-base"></a><a name="matt-premerge-20091211"></a><a name="jymxensuspend-base"></a><a name="jym-xensuspend-nbase"></a><a name="jym-xensuspend-base"></a><a name="HEAD"></a><a name="MAIN"></a>
 Revision <a href="snprintb.c?rev=1.5&amp;content-type=text/x-cvsweb-markup"><b>1.5</b></a> / (<a href="/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.5&amp;content-type=text/plain" target="cvs_checkout" onclick="window.open('/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.5&amp;content-type=text/plain','cvs_checkout','resizable,scrollbars');return false"><b>download</b></a>) - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?annotate=1.5">annotate</a> - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?r1=1.5">[select for diffs]</a>, <i>Wed May 13 02:50:31 2009 UTC</i> (12 months, 3 weeks ago) by <i>pgoyette</i>
<br>Branch: <b><a href="./snprintb.c?only_with_tag=MAIN">MAIN</a>
</b>
<br>CVS Tags: <b><a href="./snprintb.c?only_with_tag=yamt-nfs-mp-base9">yamt-nfs-mp-base9</a>,
<a href="./snprintb.c?only_with_tag=yamt-nfs-mp-base8">yamt-nfs-mp-base8</a>,
<a href="./snprintb.c?only_with_tag=yamt-nfs-mp-base7">yamt-nfs-mp-base7</a>,
<a href="./snprintb.c?only_with_tag=yamt-nfs-mp-base6">yamt-nfs-mp-base6</a>,
<a href="./snprintb.c?only_with_tag=yamt-nfs-mp-base5">yamt-nfs-mp-base5</a>,
<a href="./snprintb.c?only_with_tag=yamt-nfs-mp-base4">yamt-nfs-mp-base4</a>,
<a href="./snprintb.c?only_with_tag=rmind-uvmplock-base">rmind-uvmplock-base</a>,
<a href="./snprintb.c?only_with_tag=matt-premerge-20091211">matt-premerge-20091211</a>,
<a href="./snprintb.c?only_with_tag=jymxensuspend-base">jymxensuspend-base</a>,
<a href="./snprintb.c?only_with_tag=jym-xensuspend-nbase">jym-xensuspend-nbase</a>,
<a href="./snprintb.c?only_with_tag=jym-xensuspend-base">jym-xensuspend-base</a>,
<a href="./snprintb.c?only_with_tag=HEAD">HEAD</a>
</b><br>Changes since <b>1.4: +126 -37
 lines</b><br>Diff to previous <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.4&amp;r2=1.5">1.4</a> (<a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.4&amp;r2=1.5&amp;f=h">colored</a>)
</p>
<pre>
Implement snprintb_m(3) to provide multi-line bit/bit-field decode.
Discussed on tech-kern.
</pre>
<hr size="1" noshade>
<p>
<a name="rev1.4"></a><a name="yamt-nfs-mp-base3"></a>
 Revision <a href="snprintb.c?rev=1.4&amp;content-type=text/x-cvsweb-markup"><b>1.4</b></a> / (<a href="/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.4&amp;content-type=text/plain" target="cvs_checkout" onclick="window.open('/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.4&amp;content-type=text/plain','cvs_checkout','resizable,scrollbars');return false"><b>download</b></a>) - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?annotate=1.4">annotate</a> - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?r1=1.4">[select for diffs]</a>, <i>Sun Jan 18 12:05:49 2009 UTC</i> (16 months, 2 weeks ago) by <i>lukem</i>
<br>Branch: <b><a href="./snprintb.c?only_with_tag=MAIN">MAIN</a>
</b>
<br>CVS Tags: <b><a href="./snprintb.c?only_with_tag=yamt-nfs-mp-base3">yamt-nfs-mp-base3</a>
</b><br>Branch point for: <b><a href="./snprintb.c?only_with_tag=jym-xensuspend">jym-xensuspend</a>
</b>
<br>Changes since <b>1.3: +6 -6
 lines</b><br>Diff to previous <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.3&amp;r2=1.4">1.3</a> (<a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.3&amp;r2=1.4&amp;f=h">colored</a>)
</p>
<pre>
fix -Wsign-compare issues
</pre>
<hr size="1" noshade>
<p>
<a name="rev1.3"></a>
 Revision <a href="snprintb.c?rev=1.3&amp;content-type=text/x-cvsweb-markup"><b>1.3</b></a> / (<a href="/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.3&amp;content-type=text/plain" target="cvs_checkout" onclick="window.open('/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.3&amp;content-type=text/plain','cvs_checkout','resizable,scrollbars');return false"><b>download</b></a>) - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?annotate=1.3">annotate</a> - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?r1=1.3">[select for diffs]</a>, <i>Wed Jan 14 21:33:22 2009 UTC</i> (16 months, 3 weeks ago) by <i>pooka</i>
<br>Branch: <b><a href="./snprintb.c?only_with_tag=MAIN">MAIN</a>
</b>
<br>Changes since <b>1.2: +4 -4
 lines</b><br>Diff to previous <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.2&amp;r2=1.3">1.2</a> (<a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.2&amp;r2=1.3&amp;f=h">colored</a>)
</p>
<pre>
Include sys/param.h in the kernel to make the vax properly pick up
memset.  Otherwise vax/macros.h doesn't get included and the usual
lossage ensues.
(I bet you saw that one coming)
</pre>
<hr size="1" noshade>
<p>
<a name="rev1.2"></a>
 Revision <a href="snprintb.c?rev=1.2&amp;content-type=text/x-cvsweb-markup"><b>1.2</b></a> / (<a href="/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.2&amp;content-type=text/plain" target="cvs_checkout" onclick="window.open('/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.2&amp;content-type=text/plain','cvs_checkout','resizable,scrollbars');return false"><b>download</b></a>) - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?annotate=1.2">annotate</a> - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?r1=1.2">[select for diffs]</a>, <i>Wed Dec 17 16:02:27 2008 UTC</i> (17 months, 2 weeks ago) by <i>christos</i>
<br>Branch: <b><a href="./snprintb.c?only_with_tag=MAIN">MAIN</a>
</b>
<br>Changes since <b>1.1: +27 -25
 lines</b><br>Diff to previous <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.1&amp;r2=1.2">1.1</a> (<a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff?r1=1.1&amp;r2=1.2&amp;f=h">colored</a>)
</p>
<pre>
We don't need this for _STANDALONE, and it needs snprintf to work.
</pre>
<hr size="1" noshade>
<p>
<a name="rev1.1"></a>
 Revision <a href="snprintb.c?rev=1.1&amp;content-type=text/x-cvsweb-markup"><b>1.1</b></a> / (<a href="/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.1&amp;content-type=text/plain" target="cvs_checkout" onclick="window.open('/bsdweb.cgi/~checkout~/src/common/lib/libutil/snprintb.c?rev=1.1&amp;content-type=text/plain','cvs_checkout','resizable,scrollbars');return false"><b>download</b></a>) - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?annotate=1.1">annotate</a> - <a href="/bsdweb.cgi/src/common/lib/libutil/snprintb.c?r1=1.1">[select for diffs]</a>, <i>Tue Dec 16 22:33:11 2008 UTC</i> (17 months, 2 weeks ago) by <i>christos</i>
<br>Branch: <b><a href="./snprintb.c?only_with_tag=MAIN">MAIN</a>
</b>
<br>
</p>
<pre>
share with kernel; replaces bitmask_snprintf which was very broken:
- subtracted one from len without checking if len was 0
- checked for a minimum buffer size
- arguments order was inconsistent with other printf like functions
- no way to tell if it overflowed
</pre>
<hr noshade>
<p>
<a name="diff">
This form allows you to request diff's between any two
revisions of a file.  You may select a symbolic revision
name using the selection box or you may type in a numeric
name using the type-in text box.
</a>
</p>
<form method="get" action="/bsdweb.cgi/src/common/lib/libutil/snprintb.c.diff" name="diff_select">
<table style="border: none">
<tr>
<td align="right"><label for="r1" accesskey="1">Diffs between </label>
<select id="r1" name="r1">
<option value="text" selected>Use Text Field</option>
<option value="1.5:yamt-nfs-mp-base9">yamt-nfs-mp-base9</option>
<option value="1.5:yamt-nfs-mp-base8">yamt-nfs-mp-base8</option>
<option value="1.5:yamt-nfs-mp-base7">yamt-nfs-mp-base7</option>
<option value="1.5:yamt-nfs-mp-base6">yamt-nfs-mp-base6</option>
<option value="1.5:yamt-nfs-mp-base5">yamt-nfs-mp-base5</option>
<option value="1.5:yamt-nfs-mp-base4">yamt-nfs-mp-base4</option>
<option value="1.4:yamt-nfs-mp-base3">yamt-nfs-mp-base3</option>
<option value="1.5:rmind-uvmplock-base">rmind-uvmplock-base</option>
<option value="1.5:matt-premerge-20091211">matt-premerge-20091211</option>
<option value="1.5:jymxensuspend-base">jymxensuspend-base</option>
<option value="1.5:jym-xensuspend-nbase">jym-xensuspend-nbase</option>
<option value="1.5:jym-xensuspend-base">jym-xensuspend-base</option>
<option value="1.4.2:jym-xensuspend">jym-xensuspend</option>
<option value="1:MAIN">MAIN</option>
<option value="1.5:HEAD">HEAD</option>
</select>
<input type="text" size="12" name="tr1" value="1.1" onchange="this.form.r1.selectedIndex=0"></td>
<td><br></td>
</tr>
<tr>
<td align="right"><label for="r2" accesskey="2">and </label>
<select id="r2" name="r2">
<option value="text" selected>Use Text Field</option>
<option value="1.5:yamt-nfs-mp-base9">yamt-nfs-mp-base9</option>
<option value="1.5:yamt-nfs-mp-base8">yamt-nfs-mp-base8</option>
<option value="1.5:yamt-nfs-mp-base7">yamt-nfs-mp-base7</option>
<option value="1.5:yamt-nfs-mp-base6">yamt-nfs-mp-base6</option>
<option value="1.5:yamt-nfs-mp-base5">yamt-nfs-mp-base5</option>
<option value="1.5:yamt-nfs-mp-base4">yamt-nfs-mp-base4</option>
<option value="1.4:yamt-nfs-mp-base3">yamt-nfs-mp-base3</option>
<option value="1.5:rmind-uvmplock-base">rmind-uvmplock-base</option>
<option value="1.5:matt-premerge-20091211">matt-premerge-20091211</option>
<option value="1.5:jymxensuspend-base">jymxensuspend-base</option>
<option value="1.5:jym-xensuspend-nbase">jym-xensuspend-nbase</option>
<option value="1.5:jym-xensuspend-base">jym-xensuspend-base</option>
<option value="1.4.2:jym-xensuspend">jym-xensuspend</option>
<option value="1:MAIN">MAIN</option>
<option value="1.5:HEAD">HEAD</option>
</select>
<input type="text" size="12" name="tr2" value="1.4.2.1" onchange="this.form.r2.selectedIndex=0"></td>
<td><input type="submit" value="  Get Diffs  " accesskey="G"></td>
</tr>
</table>
</form>
<hr noshade>
<form method="get" action="/bsdweb.cgi/src/common/lib/libutil/snprintb.c">
<table style="border: none">
<tr>
<td align="right"><label for="f" accesskey="D">Preferred Diff type:</label></td>
<td><select id="f" name="f" onchange="this.form.submit()">
<option value="h">Colored</option>
<option value="H">Long colored</option>
<option value="u" selected>Unified</option>
<option value="c">Context</option>
<option value="s">Side by side</option>
</select></td>
<td></td>
</tr>
<tr>
<td align="right"><label for="only_with_tag" accesskey="B">View only Branch:</label></td>
<td><a name="branch"></a>
<select id="only_with_tag" name="only_with_tag" onchange="this.form.submit()">
<option value="">Show all branches</option>
<option>jym-xensuspend</option>
<option>MAIN</option>
</select></td>
<td></td>
</tr>
<tr>
<td align="right"><a name="logsort"></a>
<label for="logsort" accesskey="L">Sort log by:</label></td>
<td><select id="logsort" name="logsort" onchange="this.form.submit()">
<option value="cvs">Not sorted</option>
<option value="date" selected>Commit date</option>
<option value="rev">Revision</option>
</select></td>
<td><input type="submit" value="  Set  " accesskey="S"></td>
</tr>
</table>
</form>
<hr noshade>
<address><span style="font-size: smaller">CVSweb &lt;<a href="mailto:webmaster@jp.NetBSD.org">webmaster@jp.NetBSD.org</a>&gt;</span></address>
</body>
</html>
