<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="ribbon">
	<ol class="breadcrumb">
		<li>Home</li>
	</ol>
</div>
<div id="content">
	<div class="row">
		<article
			class="col-sm-12 col-md-12 col-lg-6 sortable-grid ui-sortable">

			<!-- Widget ID (each widget will need unique ID)-->
			<div
				class="jarviswidget jarviswidget-color-blue jarviswidget-sortable"
				id="wid-id-1" data-widget-editbutton="false" role="widget">
				<!-- widget options:
								usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
				
								data-widget-colorbutton="false"
								data-widget-editbutton="false"
								data-widget-togglebutton="false"
								data-widget-deletebutton="false"
								data-widget-fullscreenbutton="false"
								data-widget-custombutton="false"
								data-widget-collapsed="true"
								data-widget-sortable="false"
				
								-->
				<header role="heading">
					<div class="jarviswidget-ctrls" role="menu">
						<a href="javascript:void(0);"
							class="button-icon jarviswidget-toggle-btn" rel="tooltip"
							title="" data-placement="bottom" data-original-title="Collapse"><i
							class="fa fa-minus "></i></a> <a href="javascript:void(0);"
							class="button-icon jarviswidget-fullscreen-btn" rel="tooltip"
							title="" data-placement="bottom" data-original-title="Fullscreen"><i
							class="fa fa-expand "></i></a> <a href="javascript:void(0);"
							class="button-icon jarviswidget-delete-btn" rel="tooltip"
							title="" data-placement="bottom" data-original-title="Delete"><i
							class="fa fa-times"></i></a>
					</div>
					<div class="widget-toolbar" role="menu">
						<a data-toggle="dropdown"
							class="dropdown-toggle color-box selector"
							href="javascript:void(0);"></a>
						<ul
							class="dropdown-menu arrow-box-up-right color-select pull-right">
							<li><span class="bg-color-green"
								data-widget-setstyle="jarviswidget-color-green" rel="tooltip"
								data-placement="left" data-original-title="Green Grass"></span></li>
							<li><span class="bg-color-greenDark"
								data-widget-setstyle="jarviswidget-color-greenDark"
								rel="tooltip" data-placement="top"
								data-original-title="Dark Green"></span></li>
							<li><span class="bg-color-greenLight"
								data-widget-setstyle="jarviswidget-color-greenLight"
								rel="tooltip" data-placement="top"
								data-original-title="Light Green"></span></li>
							<li><span class="bg-color-purple"
								data-widget-setstyle="jarviswidget-color-purple" rel="tooltip"
								data-placement="top" data-original-title="Purple"></span></li>
							<li><span class="bg-color-magenta"
								data-widget-setstyle="jarviswidget-color-magenta" rel="tooltip"
								data-placement="top" data-original-title="Magenta"></span></li>
							<li><span class="bg-color-pink"
								data-widget-setstyle="jarviswidget-color-pink" rel="tooltip"
								data-placement="right" data-original-title="Pink"></span></li>
							<li><span class="bg-color-pinkDark"
								data-widget-setstyle="jarviswidget-color-pinkDark" rel="tooltip"
								data-placement="left" data-original-title="Fade Pink"></span></li>
							<li><span class="bg-color-blueLight"
								data-widget-setstyle="jarviswidget-color-blueLight"
								rel="tooltip" data-placement="top"
								data-original-title="Light Blue"></span></li>
							<li><span class="bg-color-teal"
								data-widget-setstyle="jarviswidget-color-teal" rel="tooltip"
								data-placement="top" data-original-title="Teal"></span></li>
							<li><span class="bg-color-blue"
								data-widget-setstyle="jarviswidget-color-blue" rel="tooltip"
								data-placement="top" data-original-title="Ocean Blue"></span></li>
							<li><span class="bg-color-blueDark"
								data-widget-setstyle="jarviswidget-color-blueDark" rel="tooltip"
								data-placement="top" data-original-title="Night Sky"></span></li>
							<li><span class="bg-color-darken"
								data-widget-setstyle="jarviswidget-color-darken" rel="tooltip"
								data-placement="right" data-original-title="Night"></span></li>
							<li><span class="bg-color-yellow"
								data-widget-setstyle="jarviswidget-color-yellow" rel="tooltip"
								data-placement="left" data-original-title="Day Light"></span></li>
							<li><span class="bg-color-orange"
								data-widget-setstyle="jarviswidget-color-orange" rel="tooltip"
								data-placement="bottom" data-original-title="Orange"></span></li>
							<li><span class="bg-color-orangeDark"
								data-widget-setstyle="jarviswidget-color-orangeDark"
								rel="tooltip" data-placement="bottom"
								data-original-title="Dark Orange"></span></li>
							<li><span class="bg-color-red"
								data-widget-setstyle="jarviswidget-color-red" rel="tooltip"
								data-placement="bottom" data-original-title="Red Rose"></span></li>
							<li><span class="bg-color-redLight"
								data-widget-setstyle="jarviswidget-color-redLight" rel="tooltip"
								data-placement="bottom" data-original-title="Light Red"></span></li>
							<li><span class="bg-color-white"
								data-widget-setstyle="jarviswidget-color-white" rel="tooltip"
								data-placement="right" data-original-title="Purity"></span></li>
							<li><a href="javascript:void(0);"
								class="jarviswidget-remove-colors" data-widget-setstyle=""
								rel="tooltip" data-placement="bottom"
								data-original-title="Reset widget color to default">Remove</a></li>
						</ul>
					</div>
					<span class="widget-icon"> <i class="fa fa-sitemap"></i>
					</span>
					<h2>Simple View</h2>

					<span class="jarviswidget-loader"><i
						class="fa fa-refresh fa-spin"></i></span>
				</header>

				<!-- widget div-->
				<div role="content">

					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->

					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body">

						<div class="tree smart-form">
							<ul role="tree">
								<li class="parent_li" role="treeitem"><span
									title="Collapse this branch"><i
										class="fa fa-lg fa-folder-open"></i> Parent</span>
									<ul role="group">
										<li class="parent_li" role="treeitem"><span
											title="Collapse this branch"><i
												class="fa fa-lg fa-plus-circle"></i> Administrators</span>
											<ul role="group">
												<li style="display: none"><span> <label
														class="checkbox inline-block"> <input
															type="checkbox" name="checkbox-inline"> <i></i>Michael.Jackson
													</label>
												</span></li>
												<li style="display: none"><span> <label
														class="checkbox inline-block"> <input
															type="checkbox" checked="checked" name="checkbox-inline">
															<i></i>Sunny.Ahmed
													</label>
												</span></li>
												<li style="display: none"><span> <label
														class="checkbox inline-block"> <input
															type="checkbox" checked="checked" name="checkbox-inline">
															<i></i>Jackie.Chan
													</label>
												</span></li>
											</ul></li>
										<li class="parent_li" role="treeitem"><span
											title="Collapse this branch"><i
												class="fa fa-lg fa-minus-circle"></i> Child</span>
											<ul role="group">
												<li><span><i class="icon-leaf"></i> Grand Child</span>
												</li>
												<li><span><i class="icon-leaf"></i> Grand Child</span>
												</li>
												<li class="parent_li" role="treeitem"><span
													title="Collapse this branch"><i
														class="fa fa-lg fa-plus-circle"></i> Grand Child</span>
													<ul role="group">
														<li style="display: none" class="parent_li"
															role="treeitem"><span title="Collapse this branch"><i
																class="fa fa-lg fa-plus-circle"></i> Great Grand Child</span>
															<ul role="group">
																<li style="display: none"><span><i
																		class="icon-leaf"></i> Great great Grand Child</span></li>
																<li style="display: none"><span><i
																		class="icon-leaf"></i> Great great Grand Child</span></li>
															</ul></li>
														<li style="display: none"><span><i
																class="icon-leaf"></i> Great Grand Child</span></li>
														<li style="display: none"><span><i
																class="icon-leaf"></i> Great Grand Child</span></li>
													</ul></li>
											</ul></li>
									</ul></li>
								<li class="parent_li" role="treeitem"><span
									title="Collapse this branch"><i
										class="fa fa-lg fa-folder-open"></i> Parent2</span>
									<ul role="group">
										<li><span><i class="icon-leaf"></i> Child</span></li>
									</ul></li>
							</ul>
						</div>

					</div>
					<!-- end widget content -->

				</div>
				<!-- end widget div -->

			</div>
			<!-- end widget -->

		</article>
	</div>
</div>
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!

	$(document).ready(
			function() {

				pageSetUp();

				// PAGE RELATED SCRIPTS

				$('.tree > ul').attr('role', 'tree').find('ul').attr('role',
						'group');
				$('.tree').find('li:has(ul)').addClass('parent_li').attr(
						'role', 'treeitem').find(' > span').attr('title',
						'Collapse this branch').on(
						'click',
						function(e) {
							var children = $(this).parent('li.parent_li').find(
									' > ul > li');
							if (children.is(':visible')) {
								children.hide('fast');
								$(this).attr('title', 'Expand this branch')
										.find(' > i').removeClass().addClass(
												'fa fa-lg fa-plus-circle');
							} else {
								children.show('fast');
								$(this).attr('title', 'Collapse this branch')
										.find(' > i').removeClass().addClass(
												'fa fa-lg fa-minus-circle');
							}
							e.stopPropagation();
						});

			})
</script>