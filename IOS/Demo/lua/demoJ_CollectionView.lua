
w,h = System.screenSize();

window.backgroundColor(0x000000,1);

cellHeight = 100
imageUrl1 = "http://gju2.alicdn.com/bao/uploaded/i1/10000073270926575/TB2fpg0cXXXXXb6XpXXXXXXXXXX_!!0-0-juitemmedia.jpg"
imageUrl2 = "http://img4.duitang.com/uploads/item/201306/25/20130625045508_sairr.thumb.600_0.jpeg"

collectionView = CollectionView();
collectionView.delegate
{
	Section = {
		SectionCount = 2,

		RowCount = function(section){
			return 4;
		},
		-- Spacing = function(section ){
		-- 	return 0;
		-- },
		-- EdgeInsets = function(section ){
		-- 	return 20,0,0,0;
		-- }

	},
	Cell = { 
		Id = function ( section, row ){
			if( section%2==1 ) {
				return "图片+文字";
			} else {
				return "图片+文字2";
			}
		},
		"图片+文字" = {
			Size = function(section, row){
				return (w-10)/2 ,200;
			},
			Init = function(cell){
				local cellWidth ,cellHeight = cell.window.size();
				cellHeight = cellHeight / 2;
				cell.icon = Image();
				cell.icon.frame(0, 0, cellHeight, cellHeight);

				cell.title = Label();
				cell.title.frame(0, cellHeight+2, cellHeight, 40);
				cell.title.textColor(0xffFFFF);
				cell.title.backgroundColor(0xff00ff);
				print("构造Cell--2");
			},
			Layout = function(cell , section, row)
				cell.icon.image(imageUrl1, function(){
					local x,y,w,h = cell.icon.frame();
					print("dongxicheng----",x,y,w,h);
					});

				cell.title.text("测试"..section .."--" .. row);
				print("布局Cell--" , section, "--", row);

				cell.window.backgroundColor( section*0x770000 +  (row%3)*0x33 );
			end,
			Delegate = function(section, row)
				print(section, row);
				System.gc();
			end
		},
		"图片+文字2" = {
			Size = function(section, row){
				return w ,200;
			},
			Init = function(cell)
				cell.icon = Image();
				cell.icon.frame(w*0.05, 10, cellHeight, cellHeight);

				cell.button = Button();
				cell.button.frame(0,0,100,60);
				cell.button.backgroundColor(0x777777);
				cell.button.click( function()
						Animate( function()
										cell.icon2.center(160,100);
								 end
							    ) ;
				end);


				cell.icon2 = Image();
				cell.icon2.frame(160, 0, cellHeight, cellHeight);

				print("构造Cell--2");
			end,
			Layout = function(cell , section, row)
				cell.icon.image(
					imageUrl1, 
					function() 
						local x,y,w,h = cell.icon.frame();
						print("dongxicheng----",x,y,w,h);
					end);

				cell.icon2.image(imageUrl1)
				print("布局Cell--" , section, "--", row);

				cell.window.backgroundColor( section*0x770000 +  (row%3)*0x33 );
			end,
			Delegate = function(section, row)
				print(section, row);
				System.gc();
			end
		}
	}
};

collectionView.frame(0,0,w,h-64);
collectionView.backgroundColor(0xffFFFF);
collectionView.miniSpacing(10);
-- collectionView.scrollDirection(1);


