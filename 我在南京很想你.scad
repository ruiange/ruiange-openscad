// 标牌参数
width = 200;  // 宽度
height = 60;  // 高度
depth = 3;    // 厚度
corner_r = 5; // 圆角半径
text_height = 1; // 文字凸起高度

// 文字内容
chinese_text = "我在南京很想你";  // 中文文字
pinyin_text = "WO ZAI NAN JING HEN XIANG NI";  // 拼音文字

// 字体设置
main_font = "Noto Sans SC";  // 主要字体

// 主体
union() {
    union() {
        // 蓝色主体部分（上面2/3）
        color("RoyalBlue")
        linear_extrude(depth)
        difference() {
            // 整体形状
            offset(r=corner_r)
            offset(r=-corner_r)
            square([width, height], center=true);
            // 减去下面1/3部分
            translate([0, -height/3])
            square([width+1, height/3], center=true);
        }
        
        // 白色底部部分（下面1/3）
        color("White")
        linear_extrude(depth)
        intersection() {
            // 整体形状
            offset(r=corner_r)
            offset(r=-corner_r)
            square([width, height], center=true);
            // 只保留下面1/3部分
            translate([0, -height/3])
            square([width+1, height/3], center=true);
        }
    }
    
    // 白色中文文字
    color("White") {
        // 主要中文文字
        translate([0, 0, depth])
        linear_extrude(text_height)
        text(chinese_text, size=12, spacing=1.2, halign="center", font=main_font);
        
        // 北标记
        translate([-width/2+15, height/2-15, depth])
        linear_extrude(text_height)
        text("北", size=6, halign="center", font=main_font);
        
        // 南标记
        translate([width/2-15, height/2-15, depth])
        linear_extrude(text_height)
        text("南", size=6, halign="center", font=main_font);
    }
    
    // 黑色文字
    color("Black") {
        // 拼音文字
        translate([0, -22, depth])
        linear_extrude(text_height)
        text(pinyin_text, size=6, halign="center", font=main_font);
        
        // N标记
        translate([-width/2+15, height/2-54, depth])
        linear_extrude(text_height)
        text("N", size=7, halign="center", font=main_font);
        
        // S标记
        translate([width/2-15, height/2-54, depth])
        linear_extrude(text_height)
        text("S", size=7, halign="center", font=main_font);
    }
}
