import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TestLibComponent } from './test-lib.component';

describe('TestLibComponent', (): void => {
  let component: TestLibComponent;
  let fixture: ComponentFixture<TestLibComponent>;

  beforeEach(async (): Promise<void> => {
    await TestBed.configureTestingModule({
      imports: [TestLibComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(TestLibComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', (): void => {
    expect(component).toBeTruthy();
  });
});
