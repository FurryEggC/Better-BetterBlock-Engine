# Better BetterBlock Engine

​	这是一个 I wanna fangame 的引擎，使用 GameMaker Studio 1.49999 由 BetterBlock Engine 根据一些常规的吉米克需求制成，我尽量保证这个引擎在显得不臃肿的前提下添加绝大部分吉米克以及 Effect 需求的代码。

​	这个引擎不建议你经常使用 `objBetterBlock`，甚至在 Pure Engine 里面，`objBetterBlock` 被删除。这是因为它的碰撞不精确，甚至在正常跳刺时可能出 bug （已知 bug 已修复，但我不相信 GameMaker）。建议仅在移动且推动玩家的时候使用它。

## 前言

​	目前市面上大多数的引擎在要改动代码加吉米克时都比较不便。为了缓解这种不便，我推出 Better BetterBlock Engine，它有比较明确的代码分区，在加入代码时可以根据自己的需要，在相应分区加入相应的代码。我相信如果你懂代码以及原版 YoYo 引擎的话，熟悉这个引擎不需要多少时间。

​	我不认为写这个引擎是一个聪明的决定。如果你要写一个优秀的吉米克，你就必须要大改引擎结构。对于比较基础的吉米克，这个引擎还是能稍微应付的。

​	GameMaker Studio 1.49999 的物体执行顺序与你在 object 分区摆放的物体顺序有关，这很诡异，也导致你必须保证物体在 object 栏的顺序基本不变才不会出 bug ，但是这明显与 iw 要求的“快速摆刺”相悖。我的解决方法是把常用的物体移到文件夹外面（如 `objBlock`），不常用的放到里面，然后在游戏做完的时候把它们移到相应的文件夹里。我已经把常用物体移到外面了，相信你可以把它们分好类。为了以防“和移位”，下面是物体的大致顺序：

- world - 控制整个游戏的进程，如 `objWorld`, `objBetterBlockCtrl`。
- player - 玩家相关物体，如 `objPlayer`, `objBullet`。
- blocks - 砖块类物体，如 `objBlock`, `objPushBlock`。
- slopes - 斜坡，其实也是砖块的一类。
- platforms - 板子，也是半个固体方块类。
- killers - 可以杀死玩家的东西，应该放到上面类型实体的后面。
- misc - 杂物，可以存放一些吉米克以及水藤版，如 `objSign`, `objWater2`。
- warps - 关卡的传送门，如 `objOutSideRoomChanger`, `objWarpAutoSaveNext`。
- items - 玩家可以获得的物体。
- view - 和 Effect 有关的物体，执行顺序通常无关紧要，必要时可以提前。如 `objCamera`。

