import 'package:coffe_shop_mobile_app/future/settings/add_new_address.dart';
import 'package:flutter/material.dart';

abstract class AddNewsAdViewModel extends State<AddNewAddress> {
  final mapSvg =
      '''<svg viewBox="0 0 1024 1024" class="icon" version="1.1" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M264.1 239.2c-13.8 0-20.7-9.8-25.7-17-5.1-7.3-7.7-10.2-12.7-10.2s-7.5 3-12.7 10.2c-5.1 7.2-12 17-25.7 17-13.8 0-20.7-9.8-25.7-17-5.1-7.3-7.7-10.2-12.7-10.2s-7.5 3-12.7 10.2c-5.1 7.2-12 17-25.7 17s-20.7-9.8-25.7-17c-5.1-7.3-7.7-10.2-12.7-10.2-4.4 0-8-3.6-8-8s3.6-8 8-8c13.8 0 20.7 9.8 25.7 17 5.1 7.3 7.7 10.2 12.7 10.2s7.5-3 12.7-10.2c5.1-7.2 12-17 25.7-17s20.7 9.8 25.7 17c5.1 7.3 7.7 10.2 12.7 10.2 5 0 7.5-3 12.7-10.2 5.1-7.2 12-17 25.7-17s20.7 9.8 25.7 17c5.1 7.3 7.7 10.2 12.7 10.2 4.4 0 8 3.6 8 8s-3.6 8-8 8zM264.1 289.2c-13.8 0-20.7-9.8-25.7-17-5.1-7.3-7.7-10.2-12.7-10.2s-7.5 3-12.7 10.2c-5.1 7.2-12 17-25.7 17-13.8 0-20.7-9.8-25.7-17-5.1-7.3-7.7-10.2-12.7-10.2s-7.5 3-12.7 10.2c-5.1 7.2-12 17-25.7 17s-20.7-9.8-25.7-17c-5.1-7.3-7.7-10.2-12.7-10.2-4.4 0-8-3.6-8-8s3.6-8 8-8c13.8 0 20.7 9.8 25.7 17 5.1 7.3 7.7 10.2 12.7 10.2s7.5-3 12.7-10.2c5.1-7.2 12-17 25.7-17s20.7 9.8 25.7 17c5.1 7.3 7.7 10.2 12.7 10.2 5 0 7.5-3 12.7-10.2 5.1-7.2 12-17 25.7-17s20.7 9.8 25.7 17c5.1 7.3 7.7 10.2 12.7 10.2 4.4 0 8 3.6 8 8s-3.6 8-8 8z" fill="#C67C4E"></path><path d="M349.1 103.6m-32 0a32 32 0 1 0 64 0 32 32 0 1 0-64 0Z" fill="#FFEB4D"></path><path d="M349.1 143.6c-22.1 0-40-17.9-40-40s17.9-40 40-40 40 17.9 40 40-18 40-40 40z m0-64c-13.2 0-24 10.8-24 24s10.8 24 24 24 24-10.8 24-24-10.8-24-24-24z" fill="#C67C4E"></path><path d="M772.1 921.1h-532c-35.3 0-64-28.7-64-64v-384c0-35.3 28.7-64 64-64h532c35.3 0 64 28.7 64 64v384c0 35.3-28.7 64-64 64z" fill="#DAE5FF"></path><path d="M558.1 639.4h-320l178.5-196.7z" fill="#FFACC2"></path><path d="M459.2 502l-40.1-9.9-52.1 5.2 49.6-54.6z" fill="#FFFFFF"></path><path d="M493.1 639.4h-255l150.3-165.7z" fill="#DAE5FF"></path><path d="M346.9 519.4l22.8 16.7 18.6-14 41.4 16.9-41.3-65.3z" fill="#FFFFFF"></path><path d="M738.1 690.1m-99 0a99 99 0 1 0 198 0 99 99 0 1 0-198 0Z" fill="#88D2FC"></path><path d="M240.1 345.1c-35.3 0-64 28.7-64 64v448c0-35.3 28.7-64 64-64s64 28.7 64 64v-448c0-35.4-28.7-64-64-64zM772.1 345.1c-35.3 0-64 28.7-64 64v448c0-35.3 28.7-64 64-64s64 28.7 64 64v-448c0-35.4-28.7-64-64-64z" fill="#DAE5FF"></path><path d="M567.3 488.2c17.6-17.6 46.1-17.6 63.6 0 17.6 17.6 17.6 46.1 0 63.6-17.6 17.6-46.1 17.6-63.6 0-17.6-17.5-17.6-46 0-63.6z" fill="#FFEB4D"></path><path d="M240.1 353.1c-13.4 0-25.7 4.7-35.4 12.6 5.1 16.7 16.8 33.1 42.4 39.4 40 9.8 43.3 37.6 49 59.1v-55.1c0-30.9-25.1-56-56-56zM716.1 409.1v30.5c8.5-6.4 15.4-14.9 18.3-25.9 13.2-50.7 47.7-34.6 63.7-42.6 2.6-1.3 5.2-3.7 7.6-6.7-9.4-7.1-21-11.3-33.6-11.3-30.9 0-56 25.1-56 56z" fill="#FFFFFF"></path><path d="M951.4 734.4c-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-5.1 7.3-7.7 10.2-12.7 10.2-5 0-7.5-3-12.7-10.2-4-5.7-9.1-13-17.8-15.8v-31.2c1.4 1.6 2.9 3.6 4.7 6.2 5.1 7.2 12 17 25.7 17 13.8 0 20.7-9.8 25.7-17 5.1-7.3 7.7-10.2 12.7-10.2 5 0 7.5 3 12.7 10.2 5.1 7.2 12 17 25.7 17 4.4 0 8-3.6 8-8s-3.6-8-8-8c-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-5.1 7.3-7.7 10.2-12.7 10.2-5 0-7.5-3-12.7-10.2-4-5.7-9.1-13-17.8-15.8V409.1c0-39.7-32.3-72-72-72-37 0-67.6 28.1-71.5 64H311.6c-4-35.9-34.5-64-71.5-64-39.7 0-72 32.3-72 72v448c0 22.3 10.2 42.3 26.1 55.5H95.5c-4.4 0-8 3.6-8 8s3.6 8 8 8h824c4.4 0 8-3.6 8-8s-3.6-8-8-8H817.9c16-13.2 26.1-33.2 26.1-55.5V727.2c1.4 1.6 2.9 3.6 4.7 6.2 5.1 7.2 12 17 25.7 17 13.8 0 20.7-9.8 25.7-17 5.1-7.3 7.7-10.2 12.7-10.2s7.5 3 12.7 10.2c5.1 7.2 12 17 25.7 17 4.4 0 8-3.6 8-8s-3.4-8-7.8-8zM312.1 569.8l35.9-39.6 17 12.4c2.8 2.1 6.7 2.1 9.5-0.1l14.9-11.3 34.8 14.2 54.3 86H312.1v-61.6zM421 484.3c-0.6-0.2-1.3-0.2-1.9-0.2h-0.8l-13 1.3-6.9-10.9 17.4-19.2L440 489l-19-4.7z m33.4 24.8l88 122.4h-45l-82.6-130.9 3.6-0.4 36 8.9z m-44.8 13.1l-18.2-7.4c-2.6-1.1-5.6-0.7-7.8 1l-13.8 10.4-10.8-7.9 28.5-31.4 22.1 35.3z m-97.5 125.2h246c3 0 5.8-1.7 7.1-4.4s1.1-5.9-0.6-8.3L423.1 438c-1.4-2-3.6-3.2-6-3.3-2.4-0.1-4.8 0.8-6.4 2.6l-49.6 54.6-49 54V417.1h371.1c-10 7.1-19.4 15-28.2 23.8-9.9 9.9-18.8 20.7-26.5 32-9-5.6-19.2-8.4-29.5-8.4-14.3 0-28.7 5.5-39.6 16.4-21.8 21.9-21.8 57.5 0 79.5l31.7 31.8v2.8c0 111.4-90.6 202-202 202-27.3 0-53.3-5.5-77.1-15.3V647.4z m310.7-102.8c-6.6 6.6-15.2 9.9-23.8 9.9-7 0-14-2.2-20-6.6-1.3-1-2.6-2-3.8-3.2-13.1-13.1-13.1-34.5 0-47.7 13.1-13.1 34.4-13.1 47.5 0 13.3 13 13.3 34.4 0.1 47.6zM184.1 409.1c0-30.9 25.1-56 56-56s56 25.1 56 56v402.8c-13.2-16.3-33.4-26.8-56-26.8s-42.8 10.5-56 26.8V409.1z m644 448c0 28.3-21.1 51.8-48.4 55.5H232.5c-27.3-3.7-48.4-27.2-48.4-55.5 0-30.9 25.1-56 56-56s56 25.1 56 56c0 4.4 3.6 8 8 8s8-3.6 8-8v-58c24.3 9.2 50.3 14 77.1 14 58.2 0 113-22.7 154.1-63.9s63.9-95.9 63.9-154.1v-3l31.5-31.6c21.1-21.1 21.8-55 2.2-77.1 15.5-23.3 35.6-43.1 59.1-58.3V590c-40.3 15.4-69 54.4-69 100s28.7 84.7 69 100v67c0 4.4 3.6 8 8 8s8-3.6 8-8c0-30.9 25.1-56 56-56s56.1 25.2 56.1 56.1z m-128-249.7v165.3c-31.3-14.4-53-46-53-82.7s21.7-68.2 53-82.6z m128 204.5c-13.2-16.3-33.4-26.8-56-26.8s-42.8 10.5-56 26.8V409.1c0-30.9 25.1-56 56-56s56 25.1 56 56v402.8z" fill="#C67C4E"></path></g></svg>''';
  final double sized = 0.05;
  final double textfSize = 0.02;

  TextEditingController addressNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController buildingNodController = TextEditingController();
  TextEditingController floor = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController address = TextEditingController();

}
