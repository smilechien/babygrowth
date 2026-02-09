<%@ CodePage=65001 %>
<%
Response.CodePage = 65001
Response.CharSet = "UTF-8"
 
Dim isSubmitted
isSubmitted = (Trim(Request("switch")) <> "") 
 
%>  

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-Hant">
<head>
 
 
  <title>Scatter Plot with Highlight</title>
  <script src="https://www.rgraph.net/libraries/RGraph.common.core.js"></script>
  <script src="https://www.rgraph.net/libraries/RGraph.common.dynamic.js"></script>
  <script src="https://www.rgraph.net/libraries/RGraph.scatter.js"></script>
 
  <meta charset="UTF-8" /> <!-- ✅ Correct, modern encoding -->
  <title>iHELP system</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  
  <!-- CSS -->
  <link rel="stylesheet" href="../../autoadjust/css/style.css" type="text/css" media="screen" />
  
  <!-- JavaScript -->
  <script src="../autoadjust/js/jquery-1.7.1.min.js"></script>
  <script src="../autoadjust/js/script.js"></script>
  <script src="../autoadjust/js/forms.js"></script>
  <script src="../autoadjust/js/superfish.js"></script>
  <script src="../autoadjust/js/jquery.responsivemenu.js"></script>
  <script src="../autoadjust/js/FF-cash.js"></script>

  <!-- Placeholder Script -->
  <script type="text/javascript">
    function ClearPlaceHolder(input) {
      if (input.value == input.defaultValue) {
        input.value = "";
      }
    }
    function SetPlaceHolder(input) {
      if (input.value == "") {
        input.value = input.defaultValue;
      }
    }
    $(function () {
      $('#contact-form').forms({ ownerEmail: '#' });
    });
  </script>
<style>
.summary-text {
  font-size: 24px;
  line-height: 1.8;
  margin-bottom: 10px;
}
.summary-section {
  margin-bottom: 30px;
}
</style>

  <!-- Styles -->
  <style type="text/css">
    body { background-color: lightgrey; }
    h1 { color: blue; }
    p { color: green; }
    #cal1Container {
      position: absolute;
      display: none;
      z-index: 500;
      margin: 1em;
    }
    textarea { width: 100%; }
    .dp-highlighter { z-index: 1; }
  </style>

  <!--[if lt IE 8]>
    <div style='clear: both; text-align:center; position: relative;'>
      <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
        <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" 
             border="0" height="42" width="820" 
             alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
      </a>
    </div>
  <![endif]-->
  <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <link rel="stylesheet" href="css/ie.css" /> 
  <![endif]-->

</head>

 
<body>

 
 
<% If Not isSubmitted Then %>
 


 <form action="sildfeng.asp" method="post" style="max-width:600px; margin: 30px auto; font-size: 1.2em; font-family: Arial, sans-serif;">
  <fieldset style="padding: 20px; border: 2px solid #ccc; border-radius: 10px;">
    <legend style="font-size: 1.4em; font-weight: bold;">Baby Measurement Input</legend>

  <!-- Gender -->
<div style="text-align: center; font-size: 24px;">
  <label>Gender:</label><br>
  <input type="radio" id="male" name="gender" value="male" checked style="transform: scale(1.5); margin-right: 6px;">
  <label for="male">Male</label>&nbsp;&nbsp;
  <input type="radio" id="female" name="gender" value="female" style="transform: scale(1.5); margin-right: 6px;">
  <label for="female">Female</label>
</div><br>

    <!-- Month -->
<label>Age in Months (0-24)</label>
  
    <input type="number" id="month" name="month" value="4" min="0" max="24"  style="width: 100px; padding: 10px; font-size: 26px; background-color: #d4ffb2; color: black;"><br><br>

    <!-- Height -->
   <label for="height" style="font-size: 20px;">Height (cm):</label>


    <input type="number" id="height" name="height" value="66" step="0.1"  style="width: 100px; padding: 10px; font-size: 26px; background-color: #d4ffb2; color: black;"><br><br>
 


    <!-- Weight -->
<label for="height" style="font-size: 20px;">Weight (kg):</label>

 

    <input type="number" id="weight" name="weight" value="7.2" step="0.1" style="width: 100px; padding: 10px; font-size: 26px; background-color: #d4ffb2; color: black;"><br><br>


    <!-- Head Circumference -->
   
<label for="height" style="font-size: 20px;">Head Circumference (cm):</label>

    <input type="number" id="head_circ" name="head_circ" value="43.0" step="0.1"  style="width: 100px; padding: 10px; font-size: 26px; background-color: #d4ffb2; color: black;"><br><br>

    <!-- Hidden switch -->
    <input type="hidden" id="switch" name="switch" value="1">

    <!-- Submit button -->
   
 
<!-- Submit buttons -->
<div style="display: flex; justify-content: space-around; margin-top: 30px;">
  <button type="submit" name="plot_type" value="height"
    style="font-size: 1.1em; padding: 10px 20px; background-color: #2196F3; color: white; border: none; border-radius: 5px; cursor: pointer;">
    Show Height Plot
  </button>

  <button type="submit" name="plot_type" value="weight"
    style="font-size: 1.1em; padding: 10px 20px; background-color: #FF9800; color: white; border: none; border-radius: 5px; cursor: pointer;">
    Show Weight Plot
  </button>

  <button type="submit" name="plot_type" value="head_circ"
    style="font-size: 1.1em; padding: 10px 20px; background-color: #9C27B0; color: white; border: none; border-radius: 5px; cursor: pointer;">
    Show Head Circ. Plot
  </button>
</div>

  </fieldset>
</form>





<%
   end if
  switch=""
 
Dim monthValue

' Check if the "month" value is numeric and not empty
If IsNumeric(Trim(Request("month"))) Then
    monthValue = CDbl(Trim(Request("month")))
    
    If monthValue > 24 Then
        Response.Write "<span style='color:red; font-size:20px;'>⚠️ input age in 0 to 24 month</span>"
        Response.End
    End If
Else
    Response.Write "<span style='color:red; font-size:20px;'>⚠️ month must be numeric</span>"
    Response.End
End If

'response.write gender & height & weight & head_circ &"<br>"
' Option Explicit
 
 

Const Filename = "sildf.txt"    ' file to read
Const ForReading = 1, ForWriting = 2, ForAppending = 3
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0

' Create a filesystem object
Dim FSO
set FSO = server.createObject("Scripting.FileSystemObject")

 


' Map the logical path to the physical system path
Dim Filepath
Filepath = Server.MapPath(Filename)
   
if FSO.FileExists(Filepath) Then

    ' Get a handle to the file
    Dim file    
    set file = FSO.GetFile(Filepath)

    ' Get some info about the file
    Dim FileSize
    FileSize = file.Size
 
    ' Open the file
    Dim TextStream
    Set TextStream = file.OpenAsTextStream(ForReading, TristateUseDefault)
 
 

 mnum=0
Response.Write "<table border='1' cellpadding='5' cellspacing='0' style='border-collapse:collapse;'>"
' Read header row
 
 
    header = TextStream.ReadLine
    headerCols = Split(header, vbTab)

    Response.Write "<tr style='background-color:#f0f0f0;'>"
    For Each col In headerCols
       'Response.Write "<th>" & Server.HTMLEncode(col) & "</th>"
    Next
    Response.Write "</tr>"
End If
  '--- Declare arrays and counters ---
Dim mh(), mw(), mhc(), mai()
Dim index, i, j, tmp
index = -1

Dim sumdistance, mnum
sumdistance = 0
mnum = 0
 
'--- Read and process each data row ---
Do While Not TextStream.AtEndOfStream
    line = TextStream.ReadLine
    cols = Split(line, vbTab)
   
    ' ✅ Basic column length check
    If UBound(cols) >= 9 Then
        gendera = Trim(cols(1))
        montha = Trim(cols(2))

        ' ✅ Match gender and month
        If gendera = Request("gender") And montha = Request("month") Then
            Response.Write "<tr>"

            ' ✅ Extract values (ensure conversion is safe)
            h = CDbl(Trim(cols(3)))     ' height
            w = CDbl(Trim(cols(4)))     ' weight
            hc = CDbl(Trim(cols(5)))    ' head circumference
            ai = CDbl(Trim(cols(9)))    ' a(i) from file

            ' ✅ Extract request input values
            mh2 = CDbl(Request("height"))
            mw2 = CDbl(Request("weight"))
            mhc2 = CDbl(Request("head_circ"))

            ' ✅ Compute Euclidean distance
            a1 = (mh2 - h) ^ 2
            a2 = (mw2 - w) ^ 2
            a3 = (mhc2 - hc) ^ 2

            sumdistance2 = a1 + a2 + a3
            a_i = 0
            If sumdistance2 > 0 Then a_i = Round(Sqr(sumdistance2), 4)

            ' ✅ Store into arrays
            index = index + 1
            ReDim Preserve mh(index)
            ReDim Preserve mw(index)
            ReDim Preserve mhc(index)
            ReDim Preserve mai(index)

            mh(index) = h
            mw(index) = w
            mhc(index) = hc
            mai(index) = ai
             
            ' Optional: Display data row or a_i value
            ' Response.Write "<td><strong>" & a_i & "</strong></td>"
           if a_i>0 then
            sumdistance = sumdistance + a_i
            mnum = mnum + 1
           end if
            Response.Write "</tr>"
        End If
    End If
Loop


'--- Compute average cohesion ---
If mnum > 0 Then
    a_i = Round(sumdistance / mnum, 4)
Else
    a_i = 0
End If
 

 
'--- Sort arrays using bubble sort ---
if 1=3 then
For i = 0 To mnum-1
    For j = i + 1 To UBound(mh)
        If mh(i) > mh(j) Then tmp = mh(i): mh(i) = mh(j): mh(j) = tmp
        If mw(i) > mw(j) Then tmp = mw(i): mw(i) = mw(j): mw(j) = tmp
        If mhc(i) > mhc(j) Then tmp = mhc(i): mhc(i) = mhc(j): mhc(j) = tmp
        If mai(i) > mai(j) Then tmp = mai(i): mai(i) = mai(j): mai(j) = tmp
    Next
Next
end if


'--- Percentile calculation ---
Dim h1, w1, hc1, ai1
h1 = 0: w1 = 0: hc1 = 0: ai1 = 0

For i = 0 To mnum-1
    If mh(i) <= mh2 Then h1 = h1 + 1
    If mw(i) <= mw2 Then w1 = w1 + 1
    If mhc(i) <= mhc2 Then hc1 = hc1 + 1
    If mai(i) <= a_i Then ai1 = ai1 + 1
Next

 '--- Define total samples from matched group ---
total = mnum

'--- Avoid division by zero ---
If total > 0 Then
    percentile_h = Round((h1 / total) * 100, 2)
    percentile_w = Round((w1 / total) * 100, 2)
    percentile_hc = Round((hc1 / total) * 100, 2)
    percentile_ai = 100-Round((ai1 / total) * 100, 2)
Else
    percentile_h = 0
    percentile_w = 0
    percentile_hc = 0
    percentile_ai = 0
End If

'--- Output summary ---
mh2 = CDbl(Request("height"))  ' Height in cm
mw2 = CDbl(Request("weight"))  ' Weight in kg

' Calculate BMI: weight (kg) / [height (m)]^2
If mh2 > 0 Then
    BMI = Round(mw2 / ((mh2 / 100) ^ 2), 2)
Else
    BMI = "N/A"
End If

 
Response.Write "<tr><td colspan='6'><br><strong><span style='font-size:50px;'>Summary</span></strong><br>" & vbCrLf

Response.Write "<span style='font-size:48px;'><font color=red>Gender: <strong>" & request("gender") & " </strong>  Month:<strong>" & request("month") & "</strong> compated to the norm(n=50)</font> </span><br>" & vbCrLf

Response.Write "----------------------------------------------------------------------------------------------------" & "<br>"  &vbCrLf

Response.Write "<span style='font-size:48px;'>Height: <strong>" & mh2 & " cm</strong> at <font color=red>" & percentile_h & "</font> percentile</span><br>" & vbCrLf

Response.Write "<span style='font-size:48px;'>Weight: <strong>" & mw2 & " kg</strong> at <font color=red>" & percentile_w & "</font> percentile</span><br>" & vbCrLf

Response.Write "<span style='font-size:48px;'>Head Circumference: <strong>" & mhc2 & " cm</strong> at <font color=red>" & percentile_hc & "</font> percentile</span><br>" & vbCrLf
Response.Write "----------------------------------------------------------------------------------------------------" & "<br>" & vbCrLf

Response.Write "<span style='font-size:48px;'>Cohesion(Fit to Norm): <strong>" & Round(1/(1+a_i),2) & "</strong> at <font color=red>" & percentile_ai & "</font> percentile</span><br>" & vbCrLf

Response.Write "<span style='font-size:48px;'>Alert: Cohesion(< 0.2) & Misfit Percentile(<10th percentile)</span><br>" & vbCrLf
'Response.Write "a(i)" & a_i & "</td></tr>" & vbCrLf
Response.Write "<span style='font-size:48px;'>BMI= <strong>" & BMI & "</strong> </span><br>" & vbCrLf

Response.Write "</table>"

TextStream.Close
Set TextStream = Nothing
Set fso = Nothing

Set FSO = nothing
 
' --- Calculate cohesion index CC ---
 CC = Round(1 / (1 + a_i), 2)

Dim minX, maxX, minY, maxY
minX = 100: maxX = 0: minY = 100: maxY = 0

Dim mh2

 
' Assign plot type once to a variable
Dim plotType
plotType = LCase(Request("plot_type"))  ' Convert to lowercase for consistency

 

' Axis range adjustment
For i = 0 To mnum - 1
    If 1/(1+mai(i)) < minX Then minX = 1/(1+mai(i))
    If 1/(1+mai(i)) > maxX Then maxX = 1/(1+mai(i))
   
        if request("plot_type")="height" then 
             If mh(i) < minY Then minY = mh(i)
             If mh(i) > maxY Then maxY = mh(i)
          elseif request("plot_type")="weight" then
            If mw(i) < minY Then minY = mw(i)
             If mw(i) > maxY Then maxY = mw(i)
          elseif request("plot_type")="head_circ" then
            If mhc(i) < minY Then minY = mhc(i)
            If mhc(i) > maxY Then maxY = mhc(i)
          end if
Next

 
          if request("plot_type")="height" then 
            If minY > mh2 Then minY = mh2
             If maxY < mh2 Then maxY = mh2
         
          elseif request("plot_type")="weight" then
            If minY > mw2 Then minY = mw2
            If maxY < mw2 Then maxY = mw2
            
          else 
            If minY > mhc2 Then minY = mhc2
            If maxY < mhc2 Then maxY = mhc2
            
          end if
 
 
Dim ytitle, yvalue
Select Case LCase(Request("plot_type"))
    Case "weight"
        ytitle = "Weight (kg)"
        yvalue = mw2
         mtitle="Height vs Cohesion Index"
    Case "head_circ"
        ytitle = "Head Circumference (cm)"
        yvalue = mhc2
          mtitle="Weight vs Cohesion Index"
    Case Else
        ytitle = "Height (cm)"
        yvalue = mh2
        mtitle="Head_circ vs Cohesion Index"
End Select
 


If minX > CC Then minX = CC
If maxX < CC Then maxX = CC
%>
 
<a href="sildf.asp" style="font-size: 28px;">🔙 Return</a>
<canvas id="cvs" width="800" height="600">[No Canvas Support]</canvas>

<script>
  var myData = [
    <% For i = 0 To mnum - 1 %>
      <% 
        Dim yaxis
        Select Case LCase(Request("plot_type"))
          Case "weight": yaxis = mw(i)
          Case "head_circ": yaxis = mhc(i)
          Case Else: yaxis = mh(i)
        End Select
      %>
      [<%= 1/(1+mai(i)) %>, <%= yaxis %>],
    <% Next %>
    [<%= CC %>, <%= yvalue %>] // "Your Baby"
  ];

  var specialX = myData[myData.length - 1][0];
  var specialY = myData[myData.length - 1][1];

  var minX = Math.min(...myData.map(d => d[0])) - 0.1;
  var maxX = Math.max(...myData.map(d => d[0])) + 0.05;
  var minY = Math.min(...myData.map(d => d[1])) - 2;
  var maxY = Math.max(...myData.map(d => d[1])) + 2;

  var meanX = myData.reduce((sum, d) => sum + d[0], 0) / myData.length;
  var meanY = myData.reduce((sum, d) => sum + d[1], 0) / myData.length;

  var scatter = new RGraph.Scatter({
    id: 'cvs',
    data: myData,
    options: {
      title: '<%=mtitle%>',
      xaxisTitle: 'Cohesion Index (CC)',
      yaxisTitle: '<%=ytitle%>',  // ✅ Dynamic y-axis title
      xaxisScaleMin: minX,
      xaxisScaleMax: maxX,
      yaxisScaleMin: minY,
      yaxisScaleMax: maxY,

      xaxisScale: true,
      xaxisScaleDecimals: 2,
      xaxisTickmarksCount: 10,
      marginBottom: 60,

      tickmarks: 'circle',
      colors: ['#888'],
      tooltips: myData.map((_, i) => i === myData.length - 1 ? 'Your Baby' : null),
      textAccessible: true,
      textSize: 12,
      backgroundGridVlines: true,
      backgroundGridHlines: true
    }
  });

  scatter.ondraw = function (obj) {
    var ctx = obj.context;

    var specialX_px = obj.getXCoord(specialX);
    var specialY_px = obj.getYCoord(specialY);
    var meanX_px = obj.getXCoord(meanX);
    var meanY_px = obj.getYCoord(meanY);

    ctx.beginPath();
    ctx.arc(specialX_px, specialY_px, 10, 0, 2 * Math.PI, false);
    ctx.fillStyle = 'red';
    ctx.fill();
    ctx.lineWidth = 2;
    ctx.strokeStyle = 'black';
    ctx.stroke();

    ctx.font = 'bold 14px Arial';
    ctx.fillStyle = 'black';
    ctx.fillText('Your Baby', specialX_px + 12, specialY_px - 10);

    // Vertical dashed line for mean X
    ctx.beginPath();
    ctx.setLineDash([5, 5]);
    ctx.moveTo(meanX_px, obj.marginTop);
    ctx.lineTo(meanX_px, obj.canvas.height - obj.marginBottom);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 1.5;
    ctx.stroke();

    // Horizontal dashed line for mean Y
    ctx.beginPath();
    ctx.moveTo(obj.marginLeft, meanY_px);
    ctx.lineTo(obj.canvas.width - obj.marginRight, meanY_px);
    ctx.stroke();
    ctx.setLineDash([]);
  };

  scatter.draw();
</script>

</body>
</html>


 


 

 
 
