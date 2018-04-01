<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="ribbon">
	<ol class="breadcrumb">
		<li>Home</li>
	</ol>
</div>
<div id="content">
	<div class="row">
		<div class="col-sm-12">
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
											class="checkbox inline-block"> <input type="checkbox"
												name="checkbox-inline"> <i></i>Michael.Jackson
										</label>
									</span></li>
									<li style="display: none"><span> <label
											class="checkbox inline-block"> <input type="checkbox"
												checked="checked" name="checkbox-inline"> <i></i>Sunny.Ahmed
										</label>
									</span></li>
									<li style="display: none"><span> <label
											class="checkbox inline-block"> <input type="checkbox"
												checked="checked" name="checkbox-inline"> <i></i>Jackie.Chan
										</label>
									</span></li>
								</ul></li>
							<li class="parent_li" role="treeitem"><span
								title="Collapse this branch"><i
									class="fa fa-lg fa-minus-circle"></i> Child</span>
								<ul role="group">
									<li><span><i class="icon-leaf"></i> Grand Child</span></li>
									<li><span><i class="icon-leaf"></i> Grand Child</span></li>
									<li class="parent_li" role="treeitem"><span
										title="Collapse this branch"><i
											class="fa fa-lg fa-plus-circle"></i> Grand Child</span>
										<ul role="group">
											<li style="display: none" class="parent_li" role="treeitem"><span
												title="Collapse this branch"><i
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
	</div>
</div>
<script type="text/javascript">
	$(document).ready(
			function() {
				pageSetUp();
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