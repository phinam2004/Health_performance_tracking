# Ultrahuman Health Performance Tracking - Project Structure

## Tổng quan

Dự án Ultrahuman Health Performance Tracking được tổ chức theo kiến trúc Clean Architecture với các flow chính được phân chia thành các thư mục riêng biệt dựa trên các tính năng từ hình ảnh flow.

## Cấu trúc thư mục chính

### 📁 lib/

Thư mục gốc chứa toàn bộ source code của ứng dụng Flutter.

### 📁 lib/features/

Chứa các tính năng chính của ứng dụng, mỗi tính năng được tổ chức theo Clean Architecture:

#### 🔵 lib/features/onboarding/

- **Mô tả**: Flow onboarding cho người dùng mới
- **Số lượng**: 16 screens
- **Cấu trúc**:
  - `presentation/pages/` - Các màn hình onboarding
  - `presentation/widgets/` - Widgets riêng cho onboarding
  - `domain/` - Business logic và entities
  - `data/` - Data sources và repositories

#### 🟢 lib/features/ring_today/

- **Mô tả**: Flow chính cho việc tracking hàng ngày
- **Số lượng**: 7 screens chính với nhiều sub-flows
- **Cấu trúc**:
  - `presentation/pages/adding_tag/` - Thêm tag (9 screens)
  - `presentation/pages/logging_period/` - Logging chu kỳ (7 screens)
  - `presentation/pages/logging_activity/` - Logging hoạt động (8 screens)
  - `presentation/pages/logging_food/` - Logging thức ăn (9 screens)
    - `updating_food_quantity/` - Cập nhật số lượng thức ăn (6 screens)
    - `food_log_detail/` - Chi tiết food log (3 screens)
      - `cyborg_insights/` - Cyborg insights (3 screens)
      - `ai_food_optimiser/` - AI food optimiser (4 screens)
  - `presentation/pages/logging_breathwork/` - Logging breathwork (11 screens)
    - `breathing_protocol_info/` - Thông tin breathing protocol (2 screens)
  - `presentation/pages/completing_workout/` - Hoàn thành workout (12 screens)
  - `presentation/pages/logging_stress/` - Logging stress (4 screens)
  - `presentation/pages/sleep/` - Sleep tracking (11 screens)

#### 🟡 lib/features/health_metrics/

- **Mô tả**: Các metrics sức khỏe và theo dõi
- **Cấu trúc**:
  - `presentation/pages/sleep/` - Sleep metrics
    - `sleep_index/` - Sleep index (3 screens)
    - `share_sleep_index/` - Chia sẻ sleep index (2 screens)
  - `presentation/pages/dynamic_recovery/` - Dynamic recovery (4 screens)
    - `resting_heart_rate/` - Resting heart rate (3 screens)
  - `presentation/pages/stress_rhythm/` - Stress rhythm (5 screens)
  - `presentation/pages/temp_deviation/` - Temperature deviation (3 screens)
  - `presentation/pages/ring_past/` - Ring past data (5 screens)
  - `presentation/pages/monthly_overview/` - Monthly overview (2 screens)
  - `presentation/pages/battery_usage_mode/` - Battery usage mode (4 screens)
  - `presentation/pages/metabolism/` - Metabolism (4 screens)
    - `requesting_ultrahuman_m1/` - Requesting Ultrahuman M1 (14 screens)
  - `presentation/pages/zones/` - Zones (3 screens)
    - `creating_zone/` - Creating zone (7 screens)
    - `zone_detail/` - Zone detail (3 screens)

#### 🟠 lib/features/discover/

- **Mô tả**: Flow khám phá nội dung và tính năng
- **Cấu trúc**:
  - `presentation/pages/zone_detail/` - Zone detail (3 screens)
    - `sorting_members/` - Sorting members (3 screens)
  - `presentation/pages/share_score/` - Share score (4 screens)
  - `presentation/pages/searching_ultrahuman/` - Searching Ultrahuman (5 screens)
    - `view_all_artists/` - View all artists (2 screens)
  - `presentation/pages/watching_video/` - Watching video (3 screens)
    - `marking_completed/` - Marking completed (3 screens)
    - `downloading_image/` - Downloading image (2 screens)
  - `presentation/pages/listening_podcast/` - Listening podcast (3 screens)
    - `adding_podcast_to_list/` - Adding podcast to list (2 screens)
  - `presentation/pages/metabolic_education/` - Metabolic education (3 screens)
  - `presentation/pages/workout_series/` - Workout series (4 screens)
  - `presentation/pages/series_detail/` - Series detail (5 screens)
  - `presentation/pages/soundscapes_detail/` - Soundscapes detail (3 screens)
    - `listening_to_track/` - Listening to track (2 screens)
    - `playlist_queue/` - Playlist queue (2 screens)

#### 🔴 lib/features/profile/

- **Mô tả**: Flow profile và cài đặt người dùng
- **Cấu trúc**:
  - `presentation/pages/ultrahuman_store/` - Ultrahuman store (6 screens)
    - `become_member/` - Become member (2 screens)
    - `setting_reminder/` - Setting reminder (2 screens)
  - `presentation/pages/all_ring_orders/` - All ring orders (4 screens)
    - `tracking_order/` - Tracking order (2 screens)
  - `presentation/pages/customizing_hr_zones/` - Customizing HR zones (4 screens)
  - `presentation/pages/updating_notification_settings/` - Notification settings (4 screens)
  - `presentation/pages/answers/` - Answers (3 screens)
  - `presentation/pages/chatting_with_support/` - Chatting with support (6 screens)
  - `presentation/pages/settings/` - Settings (3 screens)
    - `changing_language/` - Changing language (8 screens)
    - `enabling_silent_mode/` - Enabling silent mode (2 screens)
    - `editing_preferences/` - Editing preferences (3 screens)
    - `privacy_policy/` - Privacy policy (2 screens)
    - `logging_out/` - Logging out (3 screens)
  - `presentation/pages/logging_in/` - Logging in (4 screens)
  - `presentation/pages/widgets/` - Widgets (1 screen)

### 📁 lib/shared/

Chứa các components và utilities được sử dụng chung:

- `widgets/` - Shared widgets
- `utils/` - Utility functions
- `constants/` - App constants
- `theme/` - App theme và styling

### 📁 lib/core/

Chứa các thành phần cốt lõi của ứng dụng:

- `errors/` - Error handling
- `network/` - Network configuration
- `usecases/` - Use cases và business logic

### 📁 lib/data/

Chứa data layer:

- `models/` - Data models
- `repositories/` - Repository implementations
- `datasources/` - Data sources (API, Local)

### 📁 lib/presentation/

Chứa presentation layer chung (nếu cần)

## Kiến trúc Clean Architecture

Mỗi feature được tổ chức theo Clean Architecture với các layer:

1. **Presentation Layer** (`presentation/`)

   - Pages/Screens
   - Widgets
   - Controllers/Blocs

2. **Domain Layer** (`domain/`)

   - Entities
   - Use cases
   - Repository interfaces

3. **Data Layer** (`data/`)
   - Repository implementations
   - Data sources
   - Models

## Quy tắc đặt tên

- Tên thư mục sử dụng snake_case
- Tên file sử dụng snake_case.dart
- Tên class sử dụng PascalCase
- Tên function/variable sử dụng camelCase

## Tổng số screens theo flow

- **Onboarding**: 16 screens
- **Ring (today)**: 7 + sub-flows = ~80+ screens
- **Health Metrics**: ~50+ screens
- **Discover**: ~30+ screens
- **Profile**: ~40+ screens

**Tổng cộng**: ~200+ screens được tổ chức trong cấu trúc này.
