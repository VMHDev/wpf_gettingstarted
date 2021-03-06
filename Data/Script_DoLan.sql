USE [DIVINGSUIT]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/8/2017 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [nchar](10) NOT NULL,
	[CatName] [nvarchar](50) NULL,
	[Exist] [bit] NOT NULL CONSTRAINT [DF_Categories_Exist]  DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/8/2017 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [nchar](10) NOT NULL,
	[OrderID] [nchar](10) NULL,
	[ProID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/8/2017 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [nchar](10) NOT NULL,
	[OrderDate] [datetime] NULL,
	[UserID] [int] NULL,
	[Total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/8/2017 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProID] [nchar](10) NOT NULL,
	[ProName] [nvarchar](100) NULL,
	[TinyDes] [ntext] NULL,
	[Price] [int] NULL,
	[CatID] [nchar](10) NULL,
	[Quantity] [int] NULL DEFAULT ((0)),
	[Exist] [bit] NOT NULL CONSTRAINT [DF_Products_Exist]  DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/8/2017 7:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[f_ID] [int] IDENTITY(1,1) NOT NULL,
	[f_Username] [nvarchar](50) NULL,
	[f_Password] [nvarchar](255) NULL,
	[f_Name] [nvarchar](100) NULL,
	[f_Email] [nvarchar](50) NULL,
	[f_DOB] [datetime] NULL,
	[f_Permission] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[f_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat001    ', N'Bộ đồ Nam', 1)
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat002    ', N'Bộ đồ Nữ', 1)
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat003    ', N'Nón bơi', 1)
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat004    ', N'Kính', 1)
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat005    ', N'Giày', 1)
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat006    ', N'Ống thở dưới nước', 1)
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat007    ', N'Chân vịt', 1)
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat008    ', N'Găng tay', 1)
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat009    ', N'Phao', 1)
INSERT [dbo].[Categories] ([CatID], [CatName], [Exist]) VALUES (N'Cat010    ', N'Phụ kiện khác', 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro001    ', N'Kính bơi Tropical 170M - 4757', N'Kính bơi Tropical được sản xuất bằng chất liệu cao su tự nhiên, nhựa sinh học có khả năng chặn nước rất tốt. 
Góc nhìn rộng, không hề ảnh hưởng tới thị lực', 145000, N'Cat004    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro002    ', N'Kính bơi Mystyle', N'Kính bơi Mystyle 1000M được sản xuất bằng chất liệu cao su tự nhiên, nhựa sinh học có khả năng chặn nước bảo vệ mắt bạn khỏi hóa chất của nước tại hồ bơi hay vị mặn của nước biển. 
Góc nhìn của kính được thiết kế rộng, không hề ảnh hưởng tới thị lực của bạn', 160000, N'Cat004    ', 15, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro003    ', N'Kính bơi chống nắng INTEX 55683', N'Kính bơi chống nắng INTEX 55683 là phụ kiện bơi lăn để bảo vệ mắt khi bơi và hạn chế ảnh hưởng của ánh nắng mặt trời.
Mắt kính bằng chất liệu Polycarbonate cao cấp rất nhẹ, bền, chống va đập, trầy xước.', 105000, N'Cat004    ', 12, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro004    ', N'Kính Bơi View V820', N'Sản xuất tại Nhật Bản – Hàng chính hãng
Dây đeo có thể điều chỉnh dễ dàng, thiết kế thon gọn, thời trang và hữu dụng
Tròng kính làm bằng polycabonate cao cấp, trống trầy
Có lớp Anti-fox chống sương mù 2 lớp, mặt trên và mặt dưới giúp nước và mô hôi không làm mờ kính khi bơi
Có lớp chống tia cực tím', 310000, N'Cat004    ', 20, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro005    ', N'Kính Bơi Trẻ Em View V730PK', N'Phù hợp cho bé nam, bé nữ đều dùng được
Có thể tăng giảm dây ngay cả khi đang đeo kính
Tròng: polycarbonate
Seal: cao su nhiệt dẻo
Wishbone: nhựa nhiệt dẻo
Dây đeo: silicone', 255000, N'Cat004    ', 30, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro006    ', N'Chân Vịt BL005', N'Chân vịt bơi lặn
Là sản phẩm sử dụng để Bơi trong hồ bơi hay lặn dưới Sông; Biển.', 320000, N'Cat007    ', 20, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro007    ', N'Chân Vịt Bơi Lội CONQUEST', N'Chân vịt bơi lặn conquest Silicon:
Là sản phẩm chân vịt  thích hợp cho huấn luyện dạy bơi trong hồ bơi hay lặn dưới Sông; Biển.', 400000, N'Cat007    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro008    ', N'Chân Vịt Bơi Lặn YINGFA', N'Chất liệu: Cao su thiên nhiên cao cấp
Màu sắc: CAM, ĐEN
Sản phẩm được đựng trong túi nhựa trong suốt.', 350000, N'Cat007    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro009    ', N'Chân Vịt Đôi Đuôi Cá Bơi Lặn', N'Là sản phẩm đặc thù có hình giống như đuôi cá (nàng tiên cá) sử dụng để Bơi trong hồ bơi hay lặn dưới Sông; Biển.
Sản phẩm có 7 size (có quay hậu): chân số từ: 34, 35, 36, 37, 38, 39, 40.
Chất liệu: Cao su thiên nhiên + Plastic', 600000, N'Cat007    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro010    ', N'Chân Vịt – Chân Vịt Đôi Bơi Lăn FINIS', N'Kính thước Sản phẩm có 2 size:
+ Size Wave (Trẻ em)- M:  31-37 (chiều dài: 54 cm; chiều rộng: 46 cm)
+ Size Rapid (Người lớn)- L:  38-46 (chiều dài: 64 cm; chiều rộng: 50 cm)
Chất liệu: Cao su thiên nhiên + Plastic
Sản phẩm được đựng trong túi nhựa trong suốt.', 2800000, N'Cat007    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro011    ', N'Giày lặn biển S38', N'Độ dày của giày lặn phụ thuộc vào nhiệt độ của nước. Giày lặn có các loại sau:
Nhiệt độ nước ấm: 2 – 3,5 mm (độ dày phổ biến)
Nhiệt độ lạnh       : 5 – 6 mm', 700000, N'Cat005    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro012    ', N'Giày lặn biển S7', N'Giày lặn biển S7 có đế được làm bằng cao su tổng hợp chắc chắn. 
Mặt đế có hình răng cưa để tăng ma sát. Giày lan bien S7 có khóa kéo ở bên má trong của giày', 1100000, N'Cat005    ', 8, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro013    ', N'Giày lặn biển S55', N'Giày lặn được làm từ cao su và đóng vai trò vật cách nhiệt, giúp giữ ấm cho đôi chân bạn.', 1000000, N'Cat005    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro014    ', N'Áo phao bơi INTEX 58660', N'Kích Thước: 23*15 (cm)
Tuổi: 3-6 tuôi
Sản phẩm rất thích hợp cho các bé, đặc biệt là các bé tập bơi, chất liệu bền đẹp, không phai và an toàn cho bé.', 80000, N'Cat009    ', 50, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro015    ', N'Nón Bơi Phoenix NP30', N'Thiết kế thời trang, tinh tế
Thiết kế chuyên nghiệp, theo form chuẩn của hiệp hội bơi lội Hàn Quốc
Sản phẩm làm bằng vật liệu Silicon mềm mại bám dính và có độ bền cao', 150000, N'Cat003    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro016    ', N'Keo dán quần áo, giày chống thấm tức thời AQUASEAL REPAIR ADHESIVE GEAR AID', N'Với keo Aquaseal Repair Adhesive bạn có thể nhanh chóng vá quần áo, giày khi bị cây, đá cạ vào làm rách một cách nhanh chóng
Bạn không muốn chỉ vì một vết rách nhỏ mà bỏ chiếc áo chống thấm, áo mưa, giày chống thấm... Aquaseal Repair Adhesive là giải pháp tối ưu cho bạn
Sử dụng dễ dàng chỉ cần bôi và thoa đều keo che lấp chỗ lủng rồi để khô
Bám dính tốt, chống thấm và chịu mài mòn tốt', 220000, N'Cat010    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro017    ', N'Mặt Nạ Lặn Aryca Sg3', N'Dây Silicone,
Mắt kính cường lực polycarbonate
Chịu được độ sâu 30m', 359000, N'Cat010    ', 6, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro018    ', N'Đèn Lặn PRINCETON TEC 40 LIGHT WATERPROOF - LEVEL 3', N'Độ sáng: 28 Lumens
Là loại đèn chuyên dùng dưới nước chuyên dụng cho đi lặn, chèo thuyền, câu cá, cắm trại hay làm việc
Có thể chiếu xa 108m
Có thể sáng liên lục 5h với chế độ bình thường
Chống nước tuyệt đối ở độ sâu 100m
Đạt tiêu chuẩn UL T3C', 560000, N'Cat010    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro019    ', N'Bình khí lặn bằng nhôm S40', N'Dung tích: 5,8 lít
Barơ : 200
Van: van đơn Coltri 25 x 2
Đường kính: 13,34 cm / 5,2 "
Chiều cao: 63,5 cm / 25 "
Trọng lượng: 7,3 Kg / 16 lbs
(trọng lượng và chiều cao chưa tính van)
Sức nổi:
Với đầy đủ xi lanh: -0,68 Kg / -1,5 lbs
Với 35 bar còn lại: +0,31 Kg / +0,68 lbs
Trống xi lanh: +0,63 Kg / +1.4 lbs', 1000000, N'Cat010    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro020    ', N'Đèn lặn PRINCETON TEC AMP 1L W/ CONE LED FLAHLIGHT', N'Độ sáng: 45 Lumens
Là loại đèn chuyên dùng dưới nước hoặc dành cho đi câu
Đi kèm đầu chụp để có thể chuyển thành dạng đuốc điện tử
Có thể sáng liên lục tối đa 72h
Chống nước tuyệt đối ở độ sâu 100m
Thân đèn dạ quang', 500000, N'Cat010    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro021    ', N'Ống thở GRECALE', N'Màu xanh trong dạng sóng
Hệ thống van xả
Mồm thở được làm bằng silicon trong chất lượng cao
Đầu có chắn ngắn nước xâm nhập', 600000, N'Cat006    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro022    ', N'Chân vịt trẻ em cỡ nhỏ INTEX 55931', N'Chân vịt trẻ em cỡ vừa INTEX 55931 được làm bằng nhựa polyme, dây chun co giãn để điều chỉnh kích thước. 
Phù hợp với trẻ trên 8 tuổi cho các nhu cầu bơi lặn, các hoạt động giải trí dưới nước trong ngày hè.', 322000, N'Cat007    ', 20, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro023    ', N'Ống thở MISTRAL', N'Màu bạc dạng sóng
Hệ thống van xả
Mồm thở được làm bằng silicon trong chất lượng cao
Đầu có chắn ngăn nước xâm nhập', 500000, N'Cat006    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro024    ', N'Kính bơi INTEX 55603', N'Kính bơi đáng yêu dùng để bảo vệ mắt bé khi đi bơi 
Mắt kính làm bằng vật liệu Polycarbonate cao cấp rất nhẹ, bền chắc, chịu va đập, chống xước 
Thích hợp với bé trong độ tuổi từ 3 đến 10 tuổi', 60000, N'Cat004    ', 50, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro025    ', N'Túi đựng vật dụng cá nhân đa năng Intex 59800', N'Kích thước : 17*14 cm
Độ dày 0.3 mm
Công dụng : Túi dùng để chứa các vật dụng cá nhân như điện thoại, tiền, đồng hồ, ... có dây đeo vào tay thuận tiện khi đi tắm ở bể bơi hoặc đi dạo ở bờ biển không bị ngấm nước. Đặc biệt bạn vẫn có thể sử dụng điện thoại cảm ứng qua bề mặt túi', 80000, N'Cat010    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro026    ', N'Mũ bơi người lớn Speedo Rule The Pool', N'Mũ bơi người lớn Speedo Slogan, kiểu dáng thời trang, cá tính, thu hút…', 190000, N'Cat003    ', 15, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro027    ', N'Dao lặn - Aquatis', N'Lưỡi thép không gỉ dài 9 cm / 3.5"
Thiết kế tay cầm công thái học
Chiều dài tổng thể 23,7 cm / 9.3"
Trọng lượng tổng thể bao gồm cả vỏ là 278 gr / 0.6 lbs
Bao gồm vỏ và dây đeo', 500000, N'Cat010    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro028    ', N'Phao bơi vỏ sò khổng lồ SS001', N'Kích thước: 170*130 cm
Phao bơi hình vỏ sò khổng lồ được sản xuất trên dây truyền công nghệ và nguyên liệu nhập khẩu từ Châu Âu. Độ dầy phao 0.3mm, kiểu dáng tuyệt đẹp, rất được ưa chuộng bởi các minh tinh và siêu mẫu hàng đầu trên thế giới, là một phụ kiện không thể thiếu trong các chuyến đi du lịch biển, các bữa tiệc pool party hoành tráng với những bộ ảnh đẹp chất ngất tạo dáng cùng phao bơi tắm nắng, tận hưởng cảm giác tuyệt vời trên hồ bơi và những bãi biển tuyệt đẹp.', 1700000, N'Cat009    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro029    ', N'Mũ bơi che tai Sbart', N'Mũ bơi che tai Sbart - Mũ bơi thiết kế phồng phần tai để che kín tai chống nước vào tai
Lưu ý: Các bạn vẫn nên dùng kèm nút tai để giảm thiểu khả năng nước vào tai nhé', 180000, N'Cat003    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro030    ', N'Bộ Đồ Bơi Nữ Mimosa Yếm Phối Ren ZID44850', N'Bộ đồ bơi nữ Mimosa yếm phối ren: Chất liệu thun lạnh co giãn, có độ đàn hồi tốt, giúp bạn thoải mái khi sử dụng. 
Thiết kế hai mảnh quyến rũ và sành điệu hơn với áo yếm phối ren cách điệu, mang đến vẻ đẹp gợi cảm, phù hợp với những cô nàng hiện đại', 300000, N'Cat002    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro031    ', N'Đồ Bơi Short CORAL Năng Động OT008', N'Đồ bơi short CORAL năng động OT008: Chất liệu Polyester co giãn, có độ đàn hồi tốt, giúp bạn thoải mái khi sử dụng. 
Thiết kế liền một mảnh mang đến sự thoải mái khi mặc, rất trẻ trung và không kém phần gợi càm, thỏa thích để tạo dáng', 500000, N'Cat002    ', 20, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro032    ', N'Phao bơi đơn có tựa lưng Intex 58825', N'Kích thước: Đường kính 135 cm
Phao nằm thư giãn chất liệu siêu dầy 0.45 mm. Mẫu mới nhất Intex 2017
Phao đôi có phần tựa lưng rất thoải mái có 2  tay cầm an toàn và thuận tiện, có 2 hộc để chai nước uống rất tiện lợi khi sử dụng.', 490000, N'Cat009    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro033    ', N'Bình khí lặn bằng thép 10L + 10L', N'Lớp gia công bên ngoài:
Được phun chụp các lớp mịn tùy chọn, 1 lớp kẽm bảo vệ, dày 90 micromet, 5 lớp sơn lót epoxy hai thành phần, 3 lớp polyurethane, các mảng màu trắng / đen thực hiện theo quy định ngành của EC.
Dung tích: 10 + 10 Lít
Barơ : 220
Van: Bibo 25 x 2
Đường kính: 17,1 cm / 6.7 " x 2
Chiều cao: 57,5 cm / 22,6 "
Trọng lượng: 10,2 Kg / 22,4 lbs x 2', 3000000, N'Cat010    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro034    ', N'Nón Bơi IST SC5', N'Kính bơi IST làm bằng silicon cao cấp, mềm, dẻo, êm đầu giúp ổn định khuông đầu, không thấm nước gây khó chịu và giúp người bơi hoặc vận động viên hoàn toàn yên tâm khi thỏa mình dưới nàn nước mát lạnh
Màu sắc: xanh trắng', 162000, N'Cat003    ', 50, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro035    ', N'Ống thở AIRMAX', N'Màu bạc dạng sóng
Hệ thống van xả
Mồm thở được làm bằng silicon trong chất lượng cao
Đầu có chắn ngăn nước xâm nhập', 200000, N'Cat006    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro036    ', N'Mặt nạ lặn có độ cận / 4.0 diop Yolto', N'Độ cận 4 diop
Xuất xứ Trung Quốc', 1029000, N'Cat010    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro037    ', N'Phao bơi chim hồng hạc khổng lồ INTEX 56288', N'Kích thước: 218*211*136  cm
Phao bơi chim hồng hạc khổng lồ INTEX có thiết kế tinh tế từng đường nét và chi tiết nhỏ bằng nguyên liệu PVC nhập khẩu từ Mỹ, xứng đáng là là sản phẩm phao khổng lồ thương hiệu số 1 thế giới về đẳng cấp và chất lượng cho những Quý cô sành điệu nhất.', 850000, N'Cat009    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro038    ', N'Nón bơi SILICONE SPEEDO', N'Nón trùm đầu khi bơi, lặn bằng chất liệu silicone co dãn tốt và không thấm nước
Có tác dụng bảo vệ và ngăn không cho tóc trôi, vướng lung tung khi đang bơi, lặn
Kiểu dáng và màu sắc thời trang', 120000, N'Cat003    ', 50, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro039    ', N'Mặt nạ chống nước Diving Mask', N'Có van 1 chiều đẩy nước ở trong ra ngoài, đây là tính năng rất ưu việt mà các loại kính thường không có, vì vậy nên không cần phải lo lắng về việc bị vào nước nữa.
Khi bị nước vào hoặc bị sương mờ phải mở cho nước vào để rửa, không cần phải trồi lên mặt nước và mở hé kính để nước chảy ra nữa mà chỉ cần một động tác giữ chặt kính và thở mạnh bằng mũi là nước sẽ bị đẩy ra ngoài theo đường van 1 chiều dưới mũi', 390000, N'Cat010    ', 9, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro040    ', N'Ống thở lặn biển chống nước vào Snorkel', N'Ống bằng nhựa PVC độ bền cao
Phần lò xo cổ ống bằng silicone giúp dễ dàng điều chỉnh, di chuyển ống mà không gây cấn, vướng
Phần miệng ngậm bằng silicone mềm mại, thiết kế khít với vòm miệng nên không bị nước vào do hở', 170000, N'Cat006    ', 15, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro041    ', N'Áo phao bơi INTEX 59661', N'Phao bơi chính hãng INTEX bơm hơi chất liệu dày, bền, không bị phai màu khi sử dụng. 
Thích hợp với các bé từ 3 đến 5 tuổi hoặc trẻ có trọng lượng nhỏ hơn 30 kg.
Tiện dụng, an toàn cho bé khi đi bơi ở bể bơi hay đi biển với hệ thống 3 van một chiều độc lập', 100000, N'Cat009    ', 20, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro042    ', N'Găng Tay Lặn Aropec', N'Găng tay lặn Aropec 3mm
Giúp giữ ấm đôi tay trong suốt quá trình lặn', 550000, N'Cat008    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro043    ', N'Cressi APNEA Wetsuit spearfishing', N'CRESSI Apnea spearfishing wetsuit dày 3.5mm hoặc 5mm .
Áo  có pad ngực, các bốsmoothskin niêm phong kín nước trên cổ, cổ tay và eo cũng như Powertex lót ở khuỷu tay và eo', 7000000, N'Cat001    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro044    ', N'Gel chống ố kính', N'Dạng gel giảm tối đa sự rửa trôi trong nước.
Giữ kính luôn trong suốt. Đảm bảo tầm nhìn tốt.
Dung tích : 30 ml', 520000, N'Cat010    ', 0, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro045    ', N'Găng Tay Lặn Cressi High Stretch', N'Bên trong  được bao phủ với chất liệu Metallite giúp cho chúng ta  dễ dàng hơn trong việc mặc chúng vào.
Hình dáng của găng tay phù hợp cho các vị trí tự nhiên của bàn tay, với những ngón tay bán cong.', 780000, N'Cat008    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro046    ', N'Cressi Tracina Wetsuit spearfishing', N'Bộ quần áo đi kèm với quần eo cao mà cũng có con dấu kín nước smoothskin ở mắt cá chân và eo cũng như quân tiếp viện powertex trên đầu gối.
Các tính năng chính
2 mảnh: áo khoác trùm đầu và quần highwaist
Tấm lót đầu gối và khuỷu tay
độ dày 3.5mm hoặc 5mm', 9000000, N'Cat001    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro047    ', N'Găng tay lặn biển S926', N'Chất liệu: găng tay lặn biển được làm từ cao su tổng hợp', 500000, N'Cat008    ', 10, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro048    ', N'Bộ áo lặn Shorty 5mm WS150', N'Áo lặn biển Shorty dòng  neoprene dày 5mm.
Khoá kéo phía trước.', 2500000, N'Cat001    ', 20, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro049    ', N'Bộ đồ lặn IST WS80 Nữ 3mm', N'Khoá kéo ống tay và chân.
Giúp giữ ấm, và bảo vệ cơ thể khỏi trầy sướt.', 2200000, N'Cat002    ', 5, 1)
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [Price], [CatID], [Quantity], [Exist]) VALUES (N'Pro050    ', N'Găng tay lặn biển S520', N'Ngoài tác dụng giữ ấm, găng tay bảo vệ bạn khỏi các vết cắt hoặc trầy xước từ các tác động trong môi trường biển.', 600000, N'Cat008    ', 4, 1)
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [f_Permission]
GO
