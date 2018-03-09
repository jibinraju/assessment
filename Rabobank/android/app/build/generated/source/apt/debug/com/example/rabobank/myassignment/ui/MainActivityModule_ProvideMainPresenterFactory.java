// Generated by dagger.internal.codegen.ComponentProcessor (https://google.github.io/dagger).
package com.example.rabobank.myassignment.ui;

import com.example.rabobank.myassignment.data.CvsServices;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import javax.inject.Provider;

public final class MainActivityModule_ProvideMainPresenterFactory
    implements Factory<MainPresenter> {
  private final Provider<MainView> mainViewProvider;

  private final Provider<CvsServices> cvsServicesProvider;

  public MainActivityModule_ProvideMainPresenterFactory(
      Provider<MainView> mainViewProvider, Provider<CvsServices> cvsServicesProvider) {
    this.mainViewProvider = mainViewProvider;
    this.cvsServicesProvider = cvsServicesProvider;
  }

  @Override
  public MainPresenter get() {
    return Preconditions.checkNotNull(
        MainActivityModule.provideMainPresenter(mainViewProvider.get(), cvsServicesProvider.get()),
        "Cannot return null from a non-@Nullable @Provides method");
  }

  public static Factory<MainPresenter> create(
      Provider<MainView> mainViewProvider, Provider<CvsServices> cvsServicesProvider) {
    return new MainActivityModule_ProvideMainPresenterFactory(
        mainViewProvider, cvsServicesProvider);
  }

  public static MainPresenter proxyProvideMainPresenter(
      MainView mainView, CvsServices cvsServices) {
    return MainActivityModule.provideMainPresenter(mainView, cvsServices);
  }
}
