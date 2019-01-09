
function statusList() {

let temp = {};

    temp[LS.WaitingWork] = {
        name: "等待上班",
        topis: "上班请按【上班】键。"
    }

    temp[LS.WaitingPassCar] = {
        name: "等待过车",
        topis: "按【绿↓】键打开/关闭雨棚灯。 \n按【紧急】键处理紧急车。 \n按【节假日】键处理节假日免费通行车辆。 \n按【下班】键下班。"
    }

    temp[LS.LogoutConfirm] = {
        name: "登出确认",
        topis: "按【确认】键确认下班。 \n按【取消】键回到上班状态。"
    }

    return temp;
}
