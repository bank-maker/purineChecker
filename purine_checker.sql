-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2022 年 11 月 11 日 22:21
-- サーバのバージョン： 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `purine_checker`
--
CREATE DATABASE IF NOT EXISTS `purine_checker` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `purine_checker`;

-- --------------------------------------------------------

--
-- テーブルの構造 `food`
--

CREATE TABLE `food` (
  `name` varchar(50) NOT NULL,
  `contain` double NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `food`
--

INSERT INTO `food` (`name`, `contain`, `type`) VALUES
('DNA/RNA', 21493.6, '健康食品'),
('Frankfurtソーセージ', 49.8, '肉類'),
('tail meat', 87.6, '肉類'),
('Vienna ソーセージ', 45.5, '肉類'),
('あんこう 肝(生)', 104.3, '酒の肴'),
('あんこう 肝(酒蒸し)', 399.2, '酒の肴'),
('あんこう 身生', 70, '酒の肴'),
('うずら卵', 0, '卵･乳製品'),
('えのきだけ', 49.4, '野菜'),
('おから', 48.6, '豆類'),
('おくら', 39.5, '野菜'),
('さきいか', 94.4, 'おつまみ・スナック類'),
('さつま揚げ', 21.4, '魚類加工品'),
('そら豆', 35.5, '野菜'),
('つくりたけ', 49.5, '野菜'),
('なめこ', 28.5, '野菜'),
('ひらたけ', 142.3, '野菜'),
('ほうれん草【芽】', 171.9, '野菜'),
('ほうれん草【葉】', 51.4, '野菜'),
('もやし', 44.7, '野菜'),
('アイナメ', 129.1, '魚類'),
('アサリ', 145.5, '貝･軟体動物'),
('アユ', 133.1, '魚類'),
('アーモンド', 31.4, 'おつまみ・スナック類'),
('イカワタ', 59.6, '酒の肴'),
('イクラ', 3.7, '酒の肴'),
('イサキ', 149.3, '魚類'),
('イサキ白子', 305.5, '酒の肴'),
('ウナギ', 92.1, '魚類'),
('ウニ', 137.3, '酒の肴'),
('オキアミ', 225.7, '貝･軟体動物'),
('カキ', 184.5, '貝･軟体動物'),
('カズノコ', 21.9, '魚類'),
('カツオ', 211.4, '魚類'),
('カツオブシ', 493.3, '干物'),
('カニミソ', 152.2, '酒の肴'),
('カリフラワー', 57.2, '野菜'),
('キス', 143.9, '魚類'),
('クルマエビ', 195.3, '貝･軟体動物'),
('クロレラ', 3182.7, '健康食品'),
('グリンピース缶詰', 18.8, '野菜'),
('コイ', 103.2, '魚類'),
('コンビーフ', 47, '肉類'),
('サケ', 119.3, '魚類'),
('サラミ', 120.4, '肉類'),
('サワラ', 139.3, '魚類'),
('サンマ', 154.9, '魚類'),
('シバエビ', 144.2, '貝･軟体動物'),
('スジコ', 15.7, '魚類'),
('スズキ', 119.5, '魚類'),
('スルメイカ', 186.8, '貝･軟体動物'),
('ズワイガニ', 136.4, '貝･軟体動物'),
('タコ', 137.3, '貝･軟体動物'),
('タコワタ', 79.8, '酒の肴'),
('タラコ', 120.7, '魚類'),
('タラバガニ', 99.6, '貝･軟体動物'),
('チーズ', 5.7, '卵･乳製品'),
('ツミレ', 67.6, '魚類加工品'),
('トビウオ', 154.6, '魚類'),
('ドジョウ', 136, '魚類'),
('ニシン', 139.6, '魚類'),
('ニジマス', 180.9, '魚類'),
('ニボシ', 746.1, '干物'),
('ハタハタ', 98.5, '魚類'),
('ハマグリ', 104.5, '貝･軟体動物'),
('ヒラメ', 133.4, '魚類'),
('ビール酵母', 2995.7, '健康食品'),
('ピーナッツ', 49.1, '豆類'),
('ブタ肉 カタ', 81.4, '肉類'),
('ブタ肉 カタスネ', 107.6, '肉類'),
('ブタ肉 カタバラ', 90.8, '肉類'),
('ブタ肉 カタロース', 95.1, '肉類'),
('ブタ肉 クビ', 70.5, '肉類'),
('ブタ肉 タン', 104, '肉類'),
('ブタ肉 バラ', 75.8, '肉類'),
('ブタ肉 ヒレ', 119.7, '肉類'),
('ブタ肉 ランプ', 113, '肉類'),
('ブタ肉 レバー', 284.8, '肉類'),
('ブタ肉 ロース', 90.9, '肉類'),
('ブタ肉 心臓', 119.2, '肉類'),
('ブタ肉 腎臓', 195, '肉類'),
('ブリ', 120.8, '魚類'),
('ブロッコリー', 70, '野菜'),
('ブロッコリースプラウト', 129.6, '野菜'),
('プレスハム', 64.4, '肉類'),
('ベーコン', 61.8, '肉類'),
('ホタテ', 76.5, '酒の肴'),
('ボタンエビ', 53.4, '酒の肴'),
('ボタンエビ 卵', 162.5, '酒の肴'),
('ボンレスハム', 74.2, '肉類'),
('マアジ', 165.3, '魚類'),
('マイワシ', 210.4, '魚類'),
('マガレイ', 113, '魚類'),
('マグロ', 157.4, '魚類'),
('マサバ', 122.1, '魚類'),
('マダイ', 128.9, '魚類'),
('メバル', 124.2, '魚類'),
('ヤリイカ', 160.5, '貝･軟体動物'),
('レバーペースト', 80, '肉類'),
('ローヤルゼリー', 403.4, '健康食品'),
('ワカサギ', 94.8, '魚類'),
('乾燥大豆', 172.5, '豆類'),
('乾燥小豆', 77.6, '豆類'),
('味噌 白味噌', 48.8, '豆類'),
('味噌 赤味噌', 63.5, '豆類'),
('大正エビ', 273.2, '貝･軟体動物'),
('大麦', 44.3, '穀類'),
('小麦粉(中力粉)', 25.8, '穀類'),
('小麦粉(強力粉)', 25.8, '穀類'),
('小麦粉(薄力粉)', 15.7, '穀類'),
('干し椎茸', 379.5, '野菜'),
('明太子', 159.3, '魚類'),
('板かまぼこ', 26.4, '魚類加工品'),
('枝豆', 47.9, '豆類'),
('柿の種', 14.1, 'おつまみ・スナック類'),
('焼きちくわ', 47.7, '魚類加工品'),
('牛乳', 0, '卵･乳製品'),
('牛肉 カタバラ', 77.4, '肉類'),
('牛肉 カタロース', 90.2, '肉類'),
('牛肉 クビ', 100.6, '肉類'),
('牛肉 スネ', 106.4, '肉類'),
('牛肉 タン', 90.4, '肉類'),
('牛肉 ヒレ', 98.4, '肉類'),
('牛肉 ブリスケ', 79.2, '肉類'),
('牛肉 ミスジ', 104, '肉類'),
('牛肉 モモ', 110.8, '肉類'),
('牛肉 リブロース', 74.2, '肉類'),
('牛肉 レバー', 219.8, '肉類'),
('牛肉 心臓', 185, '肉類'),
('牛肉 第１胃', 83.9, '肉類'),
('牛肉 腎臓', 174.2, '肉類'),
('玄米', 37.4, '穀類'),
('生ハム', 138.3, 'おつまみ・スナック類'),
('白米', 25.9, '穀類'),
('笹かまぼこ', 47.8, '魚類加工品'),
('納豆', 113.9, '豆類'),
('缶詰 サーモン', 132.9, '干物'),
('缶詰 ツナ', 116.9, '干物'),
('羊肉 マトン', 96.2, '肉類'),
('羊肉 ラム', 93.5, '肉類'),
('胚芽米', 34.5, '穀類'),
('舞茸', 98.5, '野菜'),
('蕎麦粉', 75.9, '穀類'),
('豆もやし', 57.3, '野菜'),
('豆乳', 22, '豆類'),
('豆腐 冷奴', 31.1, '豆類'),
('豆腐 湯豆腐(3分)', 21.9, '豆類'),
('豚骨ラーメン(スープ)', 32.7, 'おつまみ・スナック類'),
('豚骨ラーメン(麺)', 21.6, 'おつまみ・スナック類'),
('貝割れ大根', 73.2, '野菜'),
('赤アマダイ', 119.4, '魚類'),
('赤カマス', 147.9, '魚類'),
('醤油', 45.2, '豆類'),
('青汁粉末', 40.2, '健康食品'),
('魚ソーセージ', 22.6, '魚類加工品'),
('鯨肉 アカミ', 111.3, '肉類'),
('鳴門巻き', 32.4, '魚類加工品'),
('鶏卵', 0, '卵･乳製品'),
('鶏肉 ササミ', 153.9, '肉類'),
('鶏肉 モモ', 122.9, '肉類'),
('鶏肉 レバー', 312.2, '肉類'),
('鶏肉 手羽', 137.5, '肉類'),
('鶏肉 皮', 119.7, '肉類'),
('鶏肉 砂嚢', 142.9, '肉類');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`name`),
  ADD KEY `type` (`type`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
