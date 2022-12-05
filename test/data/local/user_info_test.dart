import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/data/repo/user_info/user_info_repo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../testing/files/hive.dart';

Future<UserInfo> _createInstance() async {
  final instance = UserInfoImpl();
  await instance.init();
  await instance.clear();
  return instance;
}

void main() async {
  setUpAll(() async {
    await HiveTestUtils.setUp();
  });

  tearDownAll(() async {
    await HiveTestUtils.cleanUp();
  });

  group('Reads and writes correctly:', () {
    test('id', () async {
      final instance = await _createInstance();
      const value = 4123;
      instance.id = value;
      expect(instance.id, value);
      await instance.close();
    });

    test('name', () async {
      final instance = await _createInstance();
      const value = 'someone';
      instance.name = value;
      expect(instance.name, value);
      await instance.close();
    });

    test('avatar medium', () async {
      final instance = await _createInstance();
      const value = 'https://example.com/avatar_medium.jpg';
      instance.avatarMedium = value;
      expect(instance.avatarMedium, value);
      await instance.close();
    });

    test('avatar large', () async {
      final instance = await _createInstance();
      const value = 'https://example.com/avatar_large.jpg';
      instance.avatarLarge = value;
      expect(instance.avatarLarge, value);
      await instance.close();
    });

    test('banner', () async {
      final instance = await _createInstance();
      const value = 'https://example.com/banner.jpg';
      instance.banner = value;
      expect(instance.banner, value);
      await instance.close();
    });

    test('donator tier', () async {
      final instance = await _createInstance();
      const value = 873;
      instance.donatorTier = value;
      expect(instance.donatorTier, value);
      await instance.close();
    });

    test('donator badge', () async {
      final instance = await _createInstance();
      const value = 'badge';
      instance.donatorBadge = value;
      expect(instance.donatorBadge, value);
      await instance.close();
    });

    test('timezone', () async {
      final instance = await _createInstance();
      const value = 'ABC';
      instance.timezone = value;
      expect(instance.timezone, value);
      await instance.close();
    });

    test('profile color', () async {
      final instance = await _createInstance();
      const value = '#123456';
      instance.profileColor = value;
      expect(instance.profileColor, value);
      await instance.close();
    });
  });

  group('Streams emit correctly:', () {
    test(
      'profile color',
      () async {
        final instance = await _createInstance();
        const value = '#123456';
        expectLater(instance.profileColorStream, emits(value));
        instance.profileColor = value;
        await instance.close();
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );
  });

  test('Saves correctly from basic user info', () async {
    final instance = await _createInstance();
    final info = BasicUserInfo(
      id: 123,
      name: 'someone',
      avatar: BasicUserInfoAvatar(
        medium: 'https://example.com/avatar_medium.jpg',
        large: 'https://example.com/avatar_large.jpg',
        $__typename: '',
      ),
      bannerImage: 'https://example.com/banner.jpg',
      donatorTier: 873,
      donatorBadge: 'badge',
      options: BasicUserInfoOptions(
        timezone: 'ABC',
        profileColor: '#123456',
        $__typename: '',
      ),
      $__typename: '',
    );
    instance.saveFromBasicUserInfo(info);
    expect(instance.id, info.id);
    expect(instance.name, info.name);
    expect(instance.avatarMedium, info.avatar?.medium);
    expect(instance.avatarLarge, info.avatar?.large);
    expect(instance.banner, info.bannerImage);
    expect(instance.donatorTier, info.donatorTier);
    expect(instance.donatorBadge, info.donatorBadge);
    expect(instance.timezone, info.options?.timezone);
    expect(instance.profileColor, info.options?.profileColor);
    await instance.close();
  });
}
