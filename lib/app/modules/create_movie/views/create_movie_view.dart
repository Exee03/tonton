import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/create_movie_controller.dart';

class CreateMovieView extends GetView<CreateMovieController> {
  const CreateMovieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Movie'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: controller.textEditorController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              textInputAction: TextInputAction.next,
              onChanged: controller.onTitleChanged,
              validator: controller.titleValidator,
            ),
            TextFormField(
              initialValue: controller.movie.value.description,
              maxLines: 3,
              minLines: 1,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              onChanged: controller.onDescriptionChanged,
              validator: controller.descriptionValidator,
            ),
            TextFormField(
              initialValue: controller.movie.value.rating.toString(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Rating',
              ),
              textInputAction: TextInputAction.next,
              onChanged: controller.onRatingChanged,
              validator: controller.ratingValidator,
            ),
            // RatingBar.builder(
            //   initialRating: 3,
            //   minRating: 1,
            //   direction: Axis.horizontal,
            //   allowHalfRating: true,
            //   itemCount: 5,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //   itemBuilder: (context, _) => Icon(
            //     Icons.star,
            //     color: Colors.amber,
            //   ),
            //   onRatingUpdate: controller.onRatingChanged,
            // ),
            TextFormField(
              initialValue: controller.movie.value.imageUrl,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                labelText: 'ImageUrl',
              ),
              onChanged: controller.onImageUrlChanged,
              validator: controller.imageUrlValidator,
            ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'releaseAt',
            //   ),
            //   onChanged: controller.onReleaseAtChanged,
            // ),
            ListTile(
              onTap: controller.onReleaseAtChanged,
              title: const Text('Release Date'),
              subtitle: Obx(() => Text(controller.selectDate)),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton.extended(
            onPressed: controller.onSubmit,
            label: const Text('SUBMIT'),
            icon: const Icon(Icons.send),
          ),
          FloatingActionButton(
            heroTag: '',
            onPressed: controller.deleteStorage,
            child: const Icon(Icons.delete),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
