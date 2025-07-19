// 灯箱主体
module lamp_box() {
    color("yellow")
    difference() {
        // 主体
        union() {
            cube([60, 30, 20], center = true);
            translate([0, 0, 10])
            cylinder(h = 10, r1 = 30, r2 = 30, center = true);
        }
        // 底部支架
        translate([0, 0, -15])
        cube([60, 30, 5], center = true);
    }
}

// 添加文字
module add_text() {
    translate([-20, 0, 15])
    text("摩的", size = 10, valign = "center", halign = "center");
    
    translate([-20, 0, -5])
    text("TAXI", size = 10, valign = "center", halign = "center");
}

// 组合模型
lamp_box();
add_text();
