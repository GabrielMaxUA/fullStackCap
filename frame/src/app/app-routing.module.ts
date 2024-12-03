import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { AboutComponent } from './about/about.component';
import { LogoutComponent } from './logout/logout.component';
import { AdminComponent } from './admin/admin.component';
import { RegistrationComponent } from './registration/registration.component';
import { GalleryComponent } from './gallery/gallery.component';
import { NatureComponent } from './gallery/nature/nature.component';
import { ArchitechtureComponent } from './gallery/architechture/architechture.component';
import { StagedComponent } from './gallery/staged/staged.component';
import { CustomersComponent } from './customers/customers.component';

const routes: Routes = [
  { path: '', redirectTo: '/about', pathMatch: 'full' },
  { path: 'signin', component: LoginComponent },
  { path: 'register', component: RegistrationComponent },
  { path: 'about', component: AboutComponent },
  { path: 'admin', component: AdminComponent},
  { path: 'customers', component: CustomersComponent},
  { path: 'gallery', component: GalleryComponent},
  { path: 'nature', component: NatureComponent},
  { path: 'architecture', component: ArchitechtureComponent},
  { path: 'staged', component: StagedComponent},
  { path: 'logout', component: LogoutComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
