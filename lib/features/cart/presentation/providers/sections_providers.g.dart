// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sectionsRepositoryHash() =>
    r'd694e838a4570a70884ddf13ad40ed3cfb67268b';

/// See also [sectionsRepository].
@ProviderFor(sectionsRepository)
final sectionsRepositoryProvider =
    AutoDisposeProvider<SectionsRepository>.internal(
  sectionsRepository,
  name: r'sectionsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sectionsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SectionsRepositoryRef = AutoDisposeProviderRef<SectionsRepository>;
String _$activeSectionHash() => r'7ef807d67cb32301ac4255c31129cc93cfd79760';

/// See also [ActiveSection].
@ProviderFor(ActiveSection)
final activeSectionProvider = NotifierProvider<ActiveSection, Section>.internal(
  ActiveSection.new,
  name: r'activeSectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeSectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveSection = Notifier<Section>;
String _$sectionsHash() => r'd5fc69351ee2cc5bd64bc4f5f97c06c5bf51a1b2';

/// See also [Sections].
@ProviderFor(Sections)
final sectionsProvider =
    AutoDisposeAsyncNotifierProvider<Sections, List<Section>>.internal(
  Sections.new,
  name: r'sectionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sectionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Sections = AutoDisposeAsyncNotifier<List<Section>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
