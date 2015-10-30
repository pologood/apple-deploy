<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>集群管理</title>

<#include "../commons/page_css.ftl" />
<#include "../commons/page_js.ftl" />
<script language="javascript" type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
	function callback() {
	 	$("#searchButton").click();
	}
	
	$().ready( function() {
		$("#listTable .btn_online").bind("click", function(){
			var id = $(this).attr("operatId");
			var title = $(this).attr("title");
			
			art.dialog.open('deploy?id=' + id, {
				id: 'viewFrame',
				title: title,
				width: '100%',   
			    height: '100%',   
			    left: '0%',   
			    top: '0%',   
			    fixed: true,   
			    resize: true,
				close: function () {}
			}, false);
		});
	});
	
</script>


</head>

<body>
<!-- start of con_right_main -->
<div class="con_right_main">

	<form id="listForm" action="list" method="post">
	
    <!-- start of con_search -->
	<div class="con_search">
    	<span class="con_box_BL"></span>
        
        <!-- start of con_search_top -->
        <div class="con_search_top clearfix">
        	<div class="con_search_top_L left">
                <p>
                    <span class="group"><label>关键字：</label>
                    	<input name="keyword" class="c_input_text" type="text" realValue="关键字" value="${(se.keyword)!''}" />
                    </span>
            		<span class="group"><a id="searchButton" href="javascript:;" class="btn_search">搜索</a></span>
                </p>
            </div>
        </div>
        <!-- end of con_search_top -->
        
        <span class="con_box_BR"></span>
    </div>
    <!-- end of con_search -->
    
	<div class="c_tipsA">截止到今日：已记录统计 <span class="red">${page.totalCount}</span> 个 </div>
    
    
    <!-- start of table_list -->
    <table id="listTable" class="table_list list">
        <tr>
        	<th width="5%">序号</th>
        	<th width="10%">集群名称</th>
        	<th width="12%">集群描述</th>
        	<th width="8%">应用个数</th>
        	<th width="12%">集群状态</th>
        	<th width="8%">最新发布时间</th>
        	<th width="8%">创建时间</th>
			<th width="10%">操作</th>
        </tr>
        <#list page.list as info>
        <tr class="even">
        	<td><!--<input type="checkbox" name="ids" value="${info.id}" />-->${info.id}</td>
        	<td style="text-align:left;">${(info.id)!}</td>
			<td>${(info.id)!}</td>
			<td>${(info.id)!}</td>
			<td>
			
			</td>
			<td>
				<#if info.updateAt?exists>
				${info.updateAt?string('yyyy-MM-dd')}
				<#else>-</#if>
			</td>
			<td>${info.createAt?string('yyyy-MM-dd')}</td>
			<td>
				<a class="btn_icon btn_edit"   href="javascript:;" operatId="${info.id}" title="编辑"></a>
                <a class="btn_icon btn_detail" href="javascript:;" operatId="${info.id}" title="详情"></a>
           		<a class="btn_icon btn_delete" href="javascript:;" operatId="${info.id}" title="删除"></a>
                <a class="btn_icon btn_online" href="javascript:;" operatId="${info.id}" title="查看应用"></a>
			</td>
        </tr>
        </#list>
        
    </table>
    <!-- end of table_list -->			
	
	<#if (page.list?size > 0)>
    
    	<!-- start of table_bottom -->
	    <div class="table_bottom clearfix">
	    	<!--
	    	<div class="table_bottom_checkbox left">
	    		<input id="selectAll" name="" type="checkbox" value=""><a id="deleteAll" class="btn" href="javascript:void(0);">删除选中</a>
	    	</div>
	    	-->
	        
	         <!-- start of 分页 -->
	   		<@paging pageNumber = page.pageNo totalPages = page.totalPage>
				<#include "../commons/pager.ftl">
			</@paging>
	        <!-- end of 分页 -->
	    </div>
	    <!-- end of table_bottom -->
			
	<#else>
		<div class="noRecord">没有找到任何记录!</div>
	</#if>
	
    </form>
</div>
<!-- end of con_right_main -->
</body>
</html>