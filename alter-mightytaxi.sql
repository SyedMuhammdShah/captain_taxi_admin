/* 19-05-2023 */
ALTER TABLE `users` ADD `otp_verify_at` timestamp NULL DEFAULT NULL; 

ALTER TABLE `ride_requests` ADD `drop_location` json DEFAULT NULL, ADD `datetime_utc` datetime DEFAULT NULL; 

CREATE TABLE `push_notifications` ( 
  `id` BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
  `title` VARCHAR(255) NULL,
  `message` LONGTEXT NULL,
  `for_rider` TINYINT NULL DEFAULT 0 ,
  `for_driver` TINYINT NULL DEFAULT 0 ,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id`)
);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (NULL, '2023_05_19_095236_add_otp_verify_at_in_users_table', '5'), (NULL, '2023_05_19_095243_add_drop_location_in_ride_requests_table', '5'), (NULL, '2023_06_26_061335_create_push_notifications_table', '5') ;

UPDATE `permissions` SET `parent_id` = '17' WHERE `permissions`.`name` = 'driver location'; 

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `parent_id`, `created_at`, `updated_at`) VALUES (NULL, 'pushnotification', 'web', NULL, '2023-06-27 06:05:42', NULL), (NULL, 'pushnotification list', 'web', 70, '2023-06-27 06:05:42', NULL), (NULL, 'pushnotification add', 'web', 70, '2023-06-27 06:06:42', NULL), (NULL, 'pushnotification delete', 'web', 70, '2023-06-27 06:06:42', NULL), (NULL, 'dispatch add', 'web', 27, '2023-09-15 10:00:05', NULL);

/* 11-02-2023 */
/*silent*/
/* 13-01-2023 */
/*
ALTER TABLE `users` ADD `last_location_update_at` datetime DEFAULT NULL AFTER `timezone`; 

ALTER TABLE `ride_requests` ADD `is_ride_for_other` tinyint(1) NULL DEFAULT '0' COMMENT '0-self, 1-other', ADD `other_rider_data` json DEFAULT NULL; 

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (NULL, '2023_01_13_071123_add_last_location_update_at_in_users_table', '4'), (NULL, '2023_01_13_071835_alter_ride_requests_table', '4');

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `parent_id`, `created_at`, `updated_at`) VALUES (NULL, 'driverearning list', 'web', '17', '2023-01-17 06:05:42', NULL), (NULL, 'driver location', 'web', NULL, '2023-01-17 06:05:42', NULL);
*/
/* 23-12-22 */
/*
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `parent_id`, `created_at`, `updated_at`) VALUES (NULL, 'driver show', 'web', '17', '2022-12-23 06:05:42', NULL), (NULL, 'rider show', 'web', '22', '2022-12-23 06:05:42', NULL), (NULL, 'complaint show', 'web', '57', '2022-12-23 06:05:42', NULL);

CREATE TABLE `complaint_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `complaint_id` bigint UNSIGNED NOT NULL,
  `added_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `complaint_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_comments_complaint_id_foreign` (`complaint_id`);


ALTER TABLE `complaint_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `complaint_comments`
  ADD CONSTRAINT `complaint_comments_complaint_id_foreign` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`) ON DELETE CASCADE;
COMMIT;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (NULL, '2022_12_20_100326_create_complaint_comments_table', '3');
*/
/* 16-12-22 */
/*
ALTER TABLE `services` ADD `description` TEXT NULL DEFAULT NULL AFTER `status`;

ALTER TABLE `users` ADD `fcm_token` TEXT NULL DEFAULT NULL AFTER `uid`; 

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (NULL, '2022_12_10_091040_alter_services_table', '2'), (NULL, '2022_12_12_082101_alter_users_table', '2');
*/