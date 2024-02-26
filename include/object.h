#ifndef clox_object_h
#define clox_object_h

#include "common.h"
#include "value.h"

#define OBJ_TYPE(value) (AS_OBJ(value)->type)

#define IS_STRING(value) isObjType(value, OBJ_STRING)

#define AS_STRING(value) ((ObjString *)AS_OBJ(value))
#define AS_CSTRING(value) (((ObjString *)AS_OBJ(value))->chars)

// Object types
typedef enum {
  OBJ_STRING,
} ObjType;

/* Base struct - Struct fields are arranged in memory in the order of
 * declaration. Allows pointing the struct to a pointer of the first field
 * (like pointing to the first element in an array)
 */
struct Obj {
  ObjType type;
  struct Obj *next;
};

// --- Derived struct ---

struct ObjString {
  Obj obj;
  int length;
  char *chars;
};

ObjString *takeString(char *chars, int length);
ObjString *copyString(const char *chars, int length);
void printObject(Value value);

static inline bool isObjType(Value value, ObjType type) {
  return IS_OBJ(value) && AS_OBJ(value)->type == type;
}

#endif