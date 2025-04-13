// 设置字体
// 中文字体
font = "Noto Sans SC:style=Black";
// 英文字体
english_font = "Arial:style=Bold";
// 数字字体
number_font = "Arial:style=Bold";

// 背景板参数
// 背景板宽度
plate_width = 120;
// 背景板高度
plate_height = 80;
// 背景板厚度
plate_thickness = 2;
// 圆角半径
corner_radius = 5;
// 底板上方元素的Z轴位置
base_z = 1;
// 文字凸出高度
text_height = 0.8;

// 第一条横线参数
// 第一条横线Y轴位置
line1_y = -9;
// 第一条横线宽度
line1_width = plate_width;
// 第一条横线粗细
line1_thickness = 0.8;
// 第一条横线高度
line1_height = text_height;

// 第二条横线参数
// 第二条横线X轴位置
line2_x = -19;
// 第二条横线Y轴位置
line2_y = -31.5;
// 第二条横线宽度
line2_width = 45;
// 第二条横线粗细
line2_thickness = 0.2;
// 第二条横线高度
line2_height = text_height;

// 文字参数设置
// 中文字体大小
chinese_text_size = 5.5;
// 中文X位置
chinese_text_x = -42;
// 中文Y位置
chinese_text_y = -30;
// 英文字体大小
english_text_size = 2;
// 英文X位置
english_text_x = -41;
// 英文Y位置
english_text_y = -34.5;
// 编号字体大小
number_text_size = 11;
// 编号X位置
number_text_x = 4;
// 编号Y位置
number_text_y = -35;
// 编号字间距
number_spacing = 1.1;

// 圆形标志参数
// 标志X位置
logo_x = -50;
// 标志Y位置
logo_y = -29;
// 标志外圆半径
logo_radius = 6;
// 标志内圆半径
logo_inner_radius = 5.5;

// 创建圆角矩形
module rounded_rect(width, height, radius) {
    hull() {
        translate([(-width/2) + radius, (-height/2) + radius, 0]) 
        circle(r=radius);
        
        translate([(width/2) - radius, (-height/2) + radius, 0]) 
        circle(r=radius);
        
        translate([(-width/2) + radius, (height/2) - radius, 0]) 
        circle(r=radius);
        
        translate([(width/2) - radius, (height/2) - radius, 0]) 
        circle(r=radius);
    }
}

// 创建背景板
module background() {
    color([0, 0.2, 0.8]) // 更准确的蓝色
    linear_extrude(height = plate_thickness, center = true)
    rounded_rect(plate_width, plate_height, corner_radius);
}

// 创建横线
module horizontal_line1() {
    color("white")
    translate([0, line1_y, base_z])
    cube([line1_width, line1_thickness, line1_height], center = true);
}

// 创建第二条横线
module horizontal_line2() {
    color("white")
    translate([line2_x, line2_y, base_z])  // 使用line2_x参数
    cube([line2_width, line2_thickness, line2_height], center = true);
}

// 创建文字
module text_content() {
    // 标志
    translate([logo_x, logo_y, base_z])
    color("white")
    linear_extrude(height = text_height)
    difference() {
        circle(r=logo_radius);
        circle(r=logo_inner_radius);
    }
    
    // 中文名称
    color("white")
    translate([chinese_text_x, chinese_text_y, base_z])
    linear_extrude(height = text_height)
    text("北科昊月学园", size = chinese_text_size, font = font);

    // 英文名称
    color("white")
    translate([english_text_x, english_text_y, base_z])
    linear_extrude(height = text_height)
    text("BEIKE  HAOYUE  SCHOOL  PARK", size = english_text_size, font = english_font);

    // 编号
    color("white")
    translate([number_text_x, number_text_y, base_z])
    linear_extrude(height = text_height)
    text("HD402", size = number_text_size, font = number_font, spacing = number_spacing);
}

// 组合背景板和文字
background();
horizontal_line1();
horizontal_line2();
text_content();
