import { TestBed } from '@angular/core/testing';

import { TestLibService } from './test-lib.service';

describe('TestLibService', (): void => {
  let service: TestLibService;

  beforeEach((): void => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TestLibService);
  });

  it('should be created', (): void => {
    expect(service).toBeTruthy();
  });
});
