{...}:

let 
iconSize = "24";
color = "#FFFFFF";
in
{

home.file."Pictures/icons/batt_full.svg".text = ''
<svg xmlns="http://www.w3.org/2000/svg" stroke="${color}" width=${iconSize} height=${iconSize} viewBox="0 0 24 24" fill="none"  stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-battery-full"><rect width="16" height="10" x="2" y="7" rx="2" ry="2"/><line x1="22" x2="22" y1="11" y2="13"/><line x1="6" x2="6" y1="11" y2="13"/><line x1="10" x2="10" y1="11" y2="13"/><line x1="14" x2="14" y1="11" y2="13"/></svg>
'';

home.file."Pictures/icons/bell.svg".text = ''
<svg xmlns="http://www.w3.org/2000/svg" stroke="${color}" width=${iconSize} height=${iconSize} viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-bell"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/></svg>
'';


  }
