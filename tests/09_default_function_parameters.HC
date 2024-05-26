#include "testhelper.HC"

I64 Add(I64 a, I64 b=76)
{
  return a + b;
}

I64 Add2(I64 a=10, I64 b=43)
{
  return a + b;
}

Bool TestDetaultBool(Bool a = TRUE) {
  return a == TRUE;
}

Bool TestDetaultI8(I8 a = 8) {
  return a == 8;
}

Bool TestDetaultI16(I16 a = 16) {
  return a == 16;
}

Bool TestDetaultI32(I32 a = 32) {
  return a == 32;
}

Bool TestDetaultI64(I64 a = 64) {
  return a == 64;
}

Bool TestDetaultStr(U8* a = "default") {
  return !StrCmp(a, "default");
}


I32 Main()
{
  "Test - Default function parameters: ";
  I64 i = Add(20);
  PrintResult(i == 96 && Add2(,43) == 53, 1);

  I64 tests = 6, correct = 0;
  if (TestDetaultBool()) correct++;
  if (TestDetaultI8()) correct++;
  if (TestDetaultI16()) correct++;
  if (TestDetaultI32()) correct++;
  if (TestDetaultI64()) correct++;
  if (TestDetaultStr()) correct++;

  PrintResult(correct,tests);

  "====\n";
  return 0;
}
