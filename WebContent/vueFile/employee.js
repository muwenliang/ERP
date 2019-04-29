//// VUE
//var vm = new Vue({
//    el: "#employee-app",
//    data: {
//        // 员工列表
//        employeeList: [],
//        // 部门列表
//        departmentList: [],
//        // 项目列表
//        projectList: [],
//        // 员工家庭成员列表
//        familyList: [],
//        // 民族列表
//        nationList: [],
//        // 员工职位列表
//        positionList: [],
//
//        searchVal: '',
//        project: '',
//        state: '',
//        department: 'sfds',
//        hostPath: '',
//
//        // 高级查询
//        category: 0,
//        begin: '',
//        end: '',
//        birthday: '0',
//
//        // 家庭成员
//        familyChild: '',
//        familybirthday: '0',
//        familyName: '',
//
//        // 双击修改员工信息
//        employeeInfo: {},
//        employee_ID: 0,
//        Account_ID: 0,
//        employeeDetail: {},
//        updateName: '',
//        updateState: 1,
//        updateSex: '',
//        updateBirth: '',
//        updateJobNum: '',
//        updateAccount: '', // ERP账号
//        updateDepartment: '',
//        updatePosition: '',
//        updateEntryDate: '', // 入职日期
//        updatePositiveDate: '', // 转正日期
//        updateResignDate: '', // 离职时间
//        updateResignType: '', // 离职类型
//        updateState: '',
//        updateRemark: '',
//        // 员工详细信息
//        updateIDNum: '',
//        updatePloitical: '',
//        updateHomeTown: '',
//        updateNationality: '',
//        updateAccountProp: '',
//        updateDomicile: '',
//        updateMarital: '',
//        updateHomeAddress: '',
//        updateCurrentAddress: '',
//        updateSchools: '',
//        updateEducation: '',
//        updateProfession: '',
//        updateGraduation: '',
//        updateAtSchool: '',
//        updateContact: '',
//        updateEmergencyContact: '',
//        updateEmergencyPhone: '',
//        updateDrivingExpe: '',
//        updateLicenseType: '', // 驾照类型
//        // 家庭成员
//        FamilyNumList: [],
//        updateAppellation: '',
//        updateFamilyName: '',
//        updateBirthday: '',
//        updateWorkaddress: '',
//        updateFamilyPosition: '',
//        updatePhone: '',
//        updateWechat: '',
//        updateAddress: '',
//
//    },
//    methods: {
//        timeInit: function (timestring) {
//            if (timestring != null && timestring != undefined) {
//                var newTimeArr = timestring.split(" ")
//                return newTimeArr[0]
//            }
//        },
//        // 获取所有员工
//        getEmployee: function () {
//            this.state = 0
//            this.department = 0
//            $.ajax({
//                url: 'http://' + vm.hostPath + '/ERP/Erp/all.action',
//                type: 'get',
//                dataType: 'json',
//                success: function (data) {
//                    vm.employeeList = data[0].all[0].all
//                },
//                error: function () {
//                    alert('网络错误，员工数据获取失败！')
//                }
//            })
//        },
//        // 获取所有部门
//        getDepartment: function () {
//            $.ajax({
//                url: 'http://' + vm.hostPath + '/ERP/Erp/condition.action',
//                type: "get",
//                dataType: "json",
//                success: function (data) {
//                    var tempList = []
//                    var dataList = data[1].section
//
//                    dataList[10].menu_nume = '  ├─财务部'
//                    tempList.push(dataList[10])
//
//                    dataList[9].menu_nume = '  ├─人力综合办'
//                    tempList.push(dataList[9])
//
//                    dataList[16].menu_nume = '  ├─一事业部'
//                    tempList.push(dataList[16])
//
//                    dataList[23].menu_nume = '    &nbsp;&nbsp;├─脑康运营'
//                    tempList.push(dataList[23])
//
//                    dataList[13].menu_nume = '    &nbsp;&nbsp;├─脑康客服'
//                    tempList.push(dataList[13])
//
//                    dataList[25].menu_nume = '    &nbsp;&nbsp;├─长沙运营'
//                    tempList.push(dataList[25])
//
//                    dataList[27].menu_nume = '    &nbsp;&nbsp;├─长沙客服'
//                    tempList.push(dataList[27])
//
//                    dataList[1].menu_nume = '    &nbsp;&nbsp;├─广州运营'
//                    tempList.push(dataList[1])
//
//                    dataList[15].menu_nume = '    &nbsp;&nbsp;├─广州客服'
//                    tempList.push(dataList[15])
//
//                    dataList[2].menu_nume = '    &nbsp;&nbsp;├─国防运营'
//                    tempList.push(dataList[2])
//
//                    dataList[14].menu_nume = '    &nbsp;&nbsp;└─国防客服'
//                    tempList.push(dataList[14])
//
//                    dataList[35].menu_nume = '  ├─二事业部'
//                    tempList.push(dataList[35])
//
//                    dataList[4].menu_nume = '    &nbsp;&nbsp;├─天津总院运营'
//                    tempList.push(dataList[4])
//
//                    dataList[11].menu_nume = '    &nbsp;&nbsp;├─天津总院客服'
//                    tempList.push(dataList[11])
//                    
//                    dataList[39].menu_nume = '    &nbsp;&nbsp;├─天津米悦运营'
//                    tempList.push(dataList[39])
//
//                    dataList[40].menu_nume = '    &nbsp;&nbsp;├─天津米悦客服'
//                    tempList.push(dataList[40])
//
//                    dataList[42].menu_nume = '    &nbsp;&nbsp;├─天津儿科运营'
//                    tempList.push(dataList[42])
//
//                    dataList[41].menu_nume = '    &nbsp;&nbsp;├─天津儿科客服'
//                    tempList.push(dataList[41])
//
//                    // dataList[31].menu_nume = '    ├─米悦新媒体'
//                    // tempList.push(dataList[31])
//
//                    dataList[32].menu_nume = '    &nbsp;&nbsp;├─高端米悦运营'
//                    tempList.push(dataList[32])
//
//                    dataList[33].menu_nume = '    &nbsp;&nbsp;└─高端米悦客服'
//                    tempList.push(dataList[33])
//
//                    dataList[36].menu_nume = '  ├─三事业部'
//                    tempList.push(dataList[36])
//
//                    dataList[3].menu_nume = '    &nbsp;&nbsp;├─成都运营'
//                    tempList.push(dataList[3])
//
//                    dataList[30].menu_nume = '    &nbsp;&nbsp;└─成都客服'
//                    tempList.push(dataList[30])
//
//                    dataList[37].menu_nume = '  ├─四事业部'
//                    tempList.push(dataList[37])
//
//                    dataList[26].menu_nume = '    &nbsp;&nbsp;├─南昌运营'
//                    tempList.push(dataList[26])
//
//                    dataList[29].menu_nume = '    &nbsp;&nbsp;├─南昌客服'
//                    tempList.push(dataList[29])
//
//                    dataList[6].menu_nume = '    &nbsp;&nbsp;├─重庆运营'
//                    tempList.push(dataList[6])
//
//                    dataList[12].menu_nume = '    &nbsp;&nbsp;├─重庆客服'
//                    tempList.push(dataList[12])
//
//                    dataList[5].menu_nume = '    &nbsp;&nbsp;├─华慈运营'
//                    tempList.push(dataList[5])
//
//                    dataList[28].menu_nume = '    &nbsp;&nbsp;└─华慈客服'
//                    tempList.push(dataList[28])
//
//                    dataList[34].menu_nume = '  ├─九博健康网'
//                    tempList.push(dataList[34])
//
//                    dataList[38].menu_nume = '  ├─公共事业部'
//                    tempList.push(dataList[38])
//
//                    dataList[22].menu_nume = '    &nbsp;&nbsp;├─企划组'
//                    tempList.push(dataList[22])
//
//                    dataList[18].menu_nume = '    &nbsp;&nbsp;├─渠道拓展部'
//                    tempList.push(dataList[18])
//
//                    dataList[7].menu_nume = '      &nbsp;&nbsp;&nbsp;&nbsp;└─外推组'
//                    tempList.push(dataList[7])
//
//                    dataList[8].menu_nume = '    &nbsp;&nbsp;├─优化组'
//                    tempList.push(dataList[8])
//
//                    dataList[20].menu_nume = '    &nbsp;&nbsp;├─技术组'
//                    tempList.push(dataList[20])
//
//                    dataList[21].menu_nume = '    &nbsp;&nbsp;├─开发组'
//                    tempList.push(dataList[21])
//
//                    dataList[19].menu_nume = '    &nbsp;&nbsp;├─策划组'
//                    tempList.push(dataList[19])
//
//                    dataList[0].menu_nume = '    &nbsp;&nbsp;├─运维组'
//                    tempList.push(dataList[0])
//
//                    dataList[31].menu_nume = '    &nbsp;&nbsp;└─新媒体'
//                    tempList.push(dataList[31])
//
//                    dataList[17].menu_nume = '  ├─总经办'
//                    tempList.push(dataList[17])
//
//                    dataList[24].menu_nume = '  └─总务科'
//                    tempList.push(dataList[24])
//
//                    tempList.forEach(function(item){
//                        console.log(item.menu_nume)
//                    })
//                    vm.departmentList = tempList
//                },
//                error: function () {
//                    alert('网络错误，部门数据获取失败！')
//                }
//            });
//        },
//        // 获取所有项目
//        getProject: function () {
//            $.ajax({
//                type: "get",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/condition.action',
//                dataType: "json",
//                success: function (data) {
//                    vm.projectList = data[0].Project_Name
//                },
//                error: function () {
//                    alert('网络错误，项目数据获取失败！')
//                }
//            });
//        },
//        // 本地搜索
//        searchEmployee: function (param) {
//            var newList = []
//            this.employeeList.forEach(
//                function (item) {
//                    if (item.name.search(param) != -1 || item.jobNum.search(param) != -1) {
//                        newList.push(item)
//                    }
//                }
//            )
//            return newList
//        },
//        // 高级查询
//        advancedQuery: function () {
//            if (this.category == 0) {
//                $("#myModalQuery").modal('hide');
//            }
//            if (this.category == 1) {
//                $.ajax({
//                    type: "get",
////                    url: 'http://' + vm.hostPath + '/ERP/Erp/EntryDateInquire.action',
//                    url: 'search/ryList',
//                    data: {
//                        begin: vm.begin,
//                        end: vm.end
//                    },
//                    dataType: "json",
//                    success: function (data) {
//                        console.log(data)
//                        vm.employeeList = data[0].message
//                        $("#myModalQuery").modal('hide');
//                    }
//                });
//            }
//            if (this.category == 2) {
//                $.ajax({
//                    type: "get",
////                    url: 'http://' + vm.hostPath + '/ERP/Erp/PositiveDateInquire.action',
//                    url: 'search/ryList',
//                    data: {
//                        begin: vm.begin,
//                        end: vm.end,
//                    },
//                    dataType: "json",
//                    success: function (data) {
//                        console.log(data)
//                        vm.employeeList = data[0].message
//                        $("#myModalQuery").modal('hide');
//                    }
//                });
//            }
//            if (this.category == 3) {
//                $.ajax({
//                    type: "get",
//                    url: 'http://' + vm.hostPath + '/ERP/Erp/ResignDateInquire.action',
//                    data: {
//                        begin: vm.begin,
//                        end: vm.end
//                    },
//                    dataType: "json",
//                    success: function (data) {
//                        console.log(data)
//                        vm.employeeList = data[0].message
//                        $("#myModalQuery").modal('hide');
//                    }
//                });
//            }
//        },
//        //通过生日月份筛选在职员工
//        birthdayScreen: function () {
//            $.ajax({
//                type: "get",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/BathInquire.action',
//                data: {
//                    number: this.birthday
//                },
//                dataType: "json",
//                success: function (data) {
//                    vm.employeeList = data[0].message
//                    $("#myModalQuery").modal('hide')
//                }
//            });
//        },
//        // 获取所有员工的家庭成员信息
//        getFamilyAll: function () {
//            $.ajax({
//                type: "get",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/FamilyALL.action',
//                dataType: "json",
//                success: function (data) {
//                    console.log(data[0].message)
//                    vm.familyList = data[0].message
//                }
//            });
//        },
//        searchFamily: function (param) {
//            var newList = []
//            this.familyList.forEach(
//                function (item) {
//                    if (item.name.search(param) != -1 || item.jobNum.toString().search(param) != -1) {
//                        newList.push(item)
//                    }
//                }
//            )
//            return newList
//        },
//        // 双击弹出员工修改框
//        showEmployeeInfo: function (ID) {
//            $("#myModalUpdate").modal('show')
//            this.getNation()
//            this.getPosition()
//            vm.employee_ID = ID
//            console.log('ID',ID)
//            // 获取员工基础信息
//            $.ajax({
//                type: "get",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/basic.action',
//                data: {
//                    ID: ID
//                },
//                dataType: "json",
//                success: function (data) {
//                    vm.employeeInfo = data.message[0]
//                    console.log(vm.employeeInfo)
//                    vm.Account_ID = data.message[0].account
//
//                    vm.updateName = vm.employeeInfo.name
//                    vm.updateState = vm.employeeInfo.state
//                    vm.updateSex = vm.employeeInfo.sex
//                    vm.updateBirth = vm.timeInit(vm.employeeInfo.birth)
//                    vm.updateJobNum = vm.employeeInfo.jobNum
//                    vm.updateAccount = vm.employeeInfo.account_Name
//                    vm.updateDepartment = vm.employeeInfo.department
//                    vm.updatePosition = vm.employeeInfo.position_Name
//                    vm.updateEntryDate = vm.timeInit(vm.employeeInfo.entryDate)
//                    vm.updatePositiveDate = vm.timeInit(vm.employeeInfo.positiveDate)
//                    vm.updateResignDate = vm.timeInit(vm.employeeInfo.resignDate)
//                    vm.updateResignType = vm.employeeInfo.resignType
//                    vm.updateRemark = vm.employeeInfo.remark
//                    // 家庭成员
//                    $.ajax({
//                        type: "get",
//                        url: 'http://' + vm.hostPath + '/ERP/Erp/FamilyNum.action',
//                        data: {
//                            Account_ID: data.message[0].account
//                        },
//                        dataType: "json",
//                        success: function (data) {
//                            console.log(data.message)
//                            vm.FamilyNumList = data.message
//                        }
//                    });
//                }
//            });
//            // 获取员工详细信息
//            $.ajax({
//                type: "get",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/particular.action',
//                data: {
//                    ID: ID
//                },
//                dataType: "json",
//                success: function (data) {
//                    vm.employeeDetail = data.message[0]
//                    console.log(vm.employeeDetail)
//
//                    vm.updateIDNum = vm.employeeDetail.IDNum
//                    // vm.updatePloitical = vm.employeeDetail.ploitical
//                    vm.updateHomeTown = vm.employeeDetail.homeTown
//                    vm.updateNationality = vm.employeeDetail.nationality
//                    vm.updateAccountProp = vm.employeeDetail.accountProp
//                    vm.updateDomicile = vm.employeeDetail.domicile
//                    vm.updateMarital = vm.employeeDetail.marital
//                    vm.updateHomeAddress = vm.employeeDetail.homeAddress
//                    vm.updateCurrentAddress = vm.employeeDetail.currentAddress
//                    vm.updateSchools = vm.employeeDetail.schools
//                    vm.updateEducation = vm.employeeDetail.education
//                    vm.updateProfession = vm.employeeDetail.profession
//                    vm.updateGraduation = vm.timeInit(vm.employeeDetail.graduation)
//                    vm.updateAtSchool = vm.employeeDetail.atSchool
//                    vm.updateContact = vm.employeeDetail.contact
//                    // vm.updateEmergencyContact = vm.employeeDetail
//                    vm.updateEmergencyPhone = vm.employeeDetail.emergencyPhone
//                    vm.updateDrivingExpe = vm.employeeDetail.drivingExpe
//                    vm.updateLicenseType = vm.employeeDetail.licenseType
//                }
//            });
//        },
//        // 修改员工信息
//        updateEmployeeInfo: function(){
//            // 修改基本信息
//            $.ajax({
//                type: "post",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/UpdateBasic.action',
//                data: {
//                    ID: vm.employee_ID,
//                    Name: vm.updateName,
//                    State: vm.updateState,
//                    Sex: vm.updateSex,
//                    Birth: vm.updateBirth+' '+'00:00:00',
//                    JobNum: vm.updateJobNum,
//
//                    Account_Name: vm.updateAccount,
//                    Department: vm.updateDepartment,
//                    Position_Name: vm.updatePosition,
//
//                    EntryDate: vm.updateEntryDate+' '+'00:00:00',
//                    PositiveDate: vm.updatePositiveDate+' '+'00:00:00',
//                    ResignDate: vm.updateResignDate+' '+'00:00:00',
//                    ResignType: vm.updateResignType,
//                    Remark: vm.updateRemark
//                },
//                success: function (response) {
//                    // 修改
//                    $.ajax({
//                        type: "method",
//                        url: "url",
//                        data: "data",
//                        dataType: "dataType",
//                        success: function (response) {
//                            
//                        }
//                    });
//
//                    $("#myModalUpdate").modal('hide')
//                    alert('修改成功！')
//                },
//                error: function(){
//                    $("#myModalUpdate").modal('hide')
//                    alert('修改失败！')
//                }
//            });
//            // 修改详细信息
//            $.ajax({
//                type: "post",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/UpdateParticular.action',
//                data: {
//                    ID: vm.employee_ID,
//                    IDNum: vm.updateIDNum,
//                    //ploitical: vm.updatePloitical,
//                    homeTown: vm.updateHomeTown,
//                    nationality: vm.updateNationality,
//                    accountProp: vm.updateAccountProp,
//                    domicile: vm.updateDomicile,
//                    marital: vm.updateMarital,
//                    homeAddress: vm.updateHomeAddress,
//                    currentAddress: vm.updateCurrentAddress,
//                    schools: vm.updateSchools,
//                    education: vm.updateEducation,
//                    profession: vm.updateProfession,
//                    graduation: vm.updateGraduation,
//                    atSchool: vm.updateAtSchool,
//                    contact: vm.updateContact,
//                    //employeeDetail: vm.updateEmergencyContact,
//                    emergencyPhone: vm.updateEmergencyPhone,
//                    drivingExpe: vm.updateDrivingExpe,
//                    licenseType: vm.updateLicenseType
//                },
//                success: function (response) {
//                    $("#myModalUpdate").modal('hide')
//                    alert('修改成功！')
//                },
//                error: function(){
//                    $("#myModalUpdate").modal('hide')
//                    alert('修改失败！')
//                }
//            });
//        },
//        // 修改员工家庭成员信息
//        updateEmployeeFamily: function(account_ID){
//            $.ajax({
//                type: "post",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/UpdateFamily.action',
//                data: {
//                    account_ID: account_ID,
//                    appellation: vm.updateAppellation,
//                    FamilyName: vm.updateFamilyName,
//                    birthday: vm.updateBirthday,
//                    workaddress: vm.updateWorkaddress,
//                    familyPosition: vm.updateFamilyPosition,
//                    phone: vm.updatePhone,
//                    wechat: vm.updateWechat,
//                    address: vm.updateAddress
//                },
//                success: function (data) {
//                    
//                }
//            });
//        },
//        // 获取民族列表
//        getNation: function () {
//            $.ajax({
//                type: "get",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/chooseNation.action',
//                dataType: "json",
//                success: function (data) {
//                    vm.nationList = data.message
//                }
//            });
//        },
//        // 获取所有职位
//        getPosition: function(){
//            $.ajax({
//                type: "get",
//                url: 'http://' + vm.hostPath + '/ERP/Erp/chooseposition.action',
//                dataType: "json",
//                success: function (data) {
//                    vm.positionList = data.message
//                }
//            });
//        }
//    },
//    mounted: function () {
//        this.$nextTick(function () {
//            this.hostPath = window.location.host
//            this.getDepartment()
//            this.getProject()
//            this.getEmployee()
//        })
//    }
//})
//
////测试submit
///*$('#btn_family1').click(function(){
//	alert("111")
//	$('#form_family1').submit();	
//})*/