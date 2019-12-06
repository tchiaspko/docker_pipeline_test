all: snap

build:
	docker build -t snap .

rebuild:
	docker build -t snap . --no-cache=true

up:
	docker-compose up

down:
	docker-compose down

clean_image_snapshots:
	echo "Removing content of __tests__/__image_snapshots__"
	rm -rf __tests__/__image_snapshots__/

check_chrome_version:
	docker-compose run snap /usr/bin/chromium-browser --version

clean_diff_output:
	echo "Removing content of __tests__/__image_snapshots__/__diff_output__"
	rm -rf __tests__/__image_snapshots__/__diff_output__

snap_with_junit_xml: clean_diff_output
	docker-compose run snap yarn test -t '${test}' --reporters=default --reporters=jest-junit 2>&1 | tee ${test}.log
	./clean_test_report.sh test-report.xml

clean_snap: clean_image_snapshots
	docker-compose run snap yarn test -t '${test}'

snap:
	docker-compose run snap yarn test -t '${test}'

snap-up:
	docker-compose run snap yarn test -t '${test}' -u

snap-all:
	docker-compose run -d snap yarn test -t 'builtio'
	docker-compose run -d snap yarn test -t 'court'
	docker-compose run -d snap yarn test -t 'directory_ca_area_code_s1000'
	docker-compose run -d snap yarn test -t 'directory_ca_counties1_s1000'
	docker-compose run -d snap yarn test -t 'directory_ca_counties2_s1000'
	docker-compose run -d snap yarn test -t 'directory_ca_counties3_s1000'
	docker-compose run -d snap yarn test -t 'directory_ca_counties4_s1000'
	docker-compose run -d snap yarn test -t 'directory_ca_counties5_s1000'
	docker-compose run -d snap yarn test -t 'directory_ca_counties6_s1000'
	docker-compose run -d snap yarn test -t 'directory_ca_top_cities_s1000'
	docker-compose run -d snap yarn test -t 'directory_name_list_s1000'
	docker-compose run -d snap yarn test -t 'directory_people_list_s1000'
	docker-compose run -d snap yarn test -t 'directory_phone_prefix_s1000'
	docker-compose run -d snap yarn test -t 'directory_s1000'
	docker-compose run -d snap yarn test -t 'directory_s1001'
	docker-compose run -d snap yarn test -t 'directory_state_s1000'
	docker-compose run -d snap yarn test -t 'historical'
	docker-compose run -d snap yarn test -t 'landing_pages_h1000_v10'
	docker-compose run -d snap yarn test -t 'landing_pages_h5000_v10'
	docker-compose run -d snap yarn test -t 'landing_pages_h5901_v10'
	docker-compose run -d snap yarn test -t 'landing_pages_h5902_v10'
	docker-compose run -d snap yarn test -t 'login_pages'
	docker-compose run -d snap yarn test -t 'purchase_p1004'
	docker-compose run -d snap yarn test -t 'purchase_p1005'
	docker-compose run -d snap yarn test -t 'purchase_p1006'
	docker-compose run -d snap yarn test -t 'social_listview'
	docker-compose run -d snap yarn test -t 'static_pages_reskin'
	docker-compose run -d snap yarn test -t 'static_pages_v10'
	docker-compose run -d snap yarn test -t 'styleguide_address_addresslist'
	docker-compose run -d snap yarn test -t 'styleguide_address_personlist'
	docker-compose run -d snap yarn test -t 'styleguide_form_checkbox'
	docker-compose run -d snap yarn test -t 'styleguide_form_radiogroup'
	docker-compose run -d snap yarn test -t 'styleguide_general_accordion'
	docker-compose run -d snap yarn test -t 'styleguide_general_avatar'
	docker-compose run -d snap yarn test -t 'styleguide_general_billboardprimary'
	docker-compose run -d snap yarn test -t 'styleguide_general_billboardsecondary'
	docker-compose run -d snap yarn test -t 'styleguide_general_breadcrumbs'
	docker-compose run -d snap yarn test -t 'styleguide_general_card'
	docker-compose run -d snap yarn test -t 'styleguide_general_carousel'
	docker-compose run -d snap yarn test -t 'styleguide_general_chip'
	docker-compose run -d snap yarn test -t 'styleguide_general_dropdown'
	docker-compose run -d snap yarn test -t 'styleguide_general_featured_on'
	docker-compose run -d snap yarn test -t 'styleguide_general_hero_section'
	docker-compose run -d snap yarn test -t 'styleguide_general_link_button'
	docker-compose run -d snap yarn test -t 'styleguide_general_linktoggleoptions'
	docker-compose run -d snap yarn test -t 'styleguide_general_overlay'
	docker-compose run -d snap yarn test -t 'styleguide_general_pagination'
	docker-compose run -d snap yarn test -t 'styleguide_general_popularlinks'
	docker-compose run -d snap yarn test -t 'styleguide_general_section_heading'
	docker-compose run -d snap yarn test -t 'styleguide_general_simple_slider'
	docker-compose run -d snap yarn test -t 'styleguide_general_static_navigation_bar'
	docker-compose run -d snap yarn test -t 'styleguide_general_svg_icon'
	docker-compose run -d snap yarn test -t 'styleguide_general_testimonial_card'
	docker-compose run -d snap yarn test -t 'styleguide_general_testimonial_grid'
	docker-compose run -d snap yarn test -t 'styleguide_general_testimonials_section'
	docker-compose run -d snap yarn test -t 'styleguide_landing_accordion_with_image'
	docker-compose run -d snap yarn test -t 'styleguide_landing_blog_section'
	docker-compose run -d snap yarn test -t 'styleguide_landing_bullet_list'
	docker-compose run -d snap yarn test -t 'styleguide_landing_bullet_with_image'
	docker-compose run -d snap yarn test -t 'styleguide_landing_caution_banner_v2'
	docker-compose run -d snap yarn test -t 'styleguide_landing_caution_banner'
	docker-compose run -d snap yarn test -t 'styleguide_landing_customer_support'
	docker-compose run -d snap yarn test -t 'styleguide_landing_faq_section'
	docker-compose run -d snap yarn test -t 'styleguide_landing_hero_search'
	docker-compose run -d snap yarn test -t 'styleguide_landing_hero'
	docker-compose run -d snap yarn test -t 'styleguide_landing_image_bullet_point_container'
	docker-compose run -d snap yarn test -t 'styleguide_landing_image_bullet_point'
	docker-compose run -d snap yarn test -t 'styleguide_landing_product_intro'
	docker-compose run -d snap yarn test -t 'styleguide_landing_product_offer'
	docker-compose run -d snap yarn test -t 'styleguide_landing_search_section'
	docker-compose run -d snap yarn test -t 'styleguide_landing_text_with_image'
	docker-compose run -d snap yarn test -t 'styleguide_landing_value_props'
	docker-compose run -d snap yarn test -t 'styleguide_landing_video_section'
	docker-compose run -d snap yarn test -t 'styleguide_list_views_card_results_list'
	docker-compose run -d snap yarn test -t 'styleguide_list_views_list_attribute'
	docker-compose run -d snap yarn test -t 'styleguide_list_views_list_bullet_list_with_icons'
	docker-compose run -d snap yarn test -t 'styleguide_list_views_list_four_columns'
	docker-compose run -d snap yarn test -t 'styleguide_list_views_list_primary'
	docker-compose run -d snap yarn test -t 'styleguide_list_views_list_secondary'
	docker-compose run -d snap yarn test -t 'styleguide_list_views_list_tertiary'
	docker-compose run -d snap yarn test -t 'styleguide_list_views_list_text'
	docker-compose run -d snap yarn test -t 'styleguide_list_views_single_column_list'
	docker-compose run -d snap yarn test -t 'styleguide_misc_obstepper'
	docker-compose run -d snap yarn test -t 'styleguide_misc_plan_item'
	docker-compose run -d snap yarn test -t 'styleguide_phone_bulleted_list_card'
	docker-compose run -d snap yarn test -t 'styleguide_phone_comment_snippet'
	docker-compose run -d snap yarn test -t 'styleguide_phone_multisection'
	docker-compose run -d snap yarn test -t 'styleguide_phone_phone_address_card'
	docker-compose run -d snap yarn test -t 'styleguide_phone_phone_historical_card'
	docker-compose run -d snap yarn test -t 'styleguide_phone_summary_details'
	docker-compose run -d snap yarn test -t 'styleguide_telescope_single_column_result'
	docker-compose run -d snap yarn test -t 'styleguide_up_avatar_card'
	docker-compose run -d snap yarn test -t 'styleguide_up_contact_info'
	docker-compose run -d snap yarn test -t 'styleguide_up_court_map'
	docker-compose run -d snap yarn test -t 'styleguide_up_list_card'
	docker-compose run -d snap yarn test -t 'styleguide_up_locked_summary_card'
	docker-compose run -d snap yarn test -t 'styleguide_up_marketing_card'
	docker-compose run -d snap yarn test -t 'styleguide_up_no_data_card'
	docker-compose run -d snap yarn test -t 'styleguide_up_profile_section'
	docker-compose run -d snap yarn test -t 'styleguide_up_promo_card'
	docker-compose run -d snap yarn test -t 'styleguide_up_search_card'
	docker-compose run -d snap yarn test -t 'styleguide_up_search_list_card'
	docker-compose run -d snap yarn test -t 'styleguide_up_summary_card'
	docker-compose run -d snap yarn test -t 'telemarketer'

pull:
	docker-compose run snap ./pull.sh

push:
	docker-compose run snap ./push.sh

check-permission:
	docker-compose run snap aws s3 ls s3://spokeo-dev-snap

check-permission_dev:
	aws s3 ls s3://spokeo-dev-snap

check-permission_qa:
	aws s3 ls s3://tf-spokeo-qa-snap-screenshots

pull_dry:
	aws s3 sync --dryrun  s3://tf-spokeo-qa-snap-screenshots ./__tests__/__image_snapshots__ --exclude .DS_Store --exclude __diff_output__/*  | tee s3pull.dry

pull_baseline:
	pwd
	echo "Start of s3 pull"; date
	echo "BEFORE the s3 pull"
	ls -lt ./__tests__/ > content_of_tests_before.log 2>&1
	echo "Running the s3 pull"
	aws s3 sync s3://tf-spokeo-qa-snap-screenshots ./__tests__/__image_snapshots__ --exclude .DS_Store --exclude __diff_output__/* > s3_sync.log 2>&1
	echo "AFTER the s3 pull"
	ls -lt ./__tests__/__image_snapshots__  > content_of_image_snapshots_after.log 2>&1
	echo "End of s3 pull"; date

push_dry:
	aws s3 sync --dryrun ./__tests__/__image_snapshots__ s3://tf-spokeo-qa-snap-screenshots --exclude .DS_Store --exclude __diff_output__/* | tee s3push.dry
	echo "If the dryrun look OK, press Y to continue."
	echo "Otherwise, press CTRL+C to exit"
	@read
#	INPUT=$(read); \
#	if [ "${INPUT}" != "Y" ]; then \
#		echo "Aborting the push to the baseline" \
#		exit 1 \
#	fi


push2: push_dry push_baseline

push_baseline:
	echo "Pushing to baseline"
