<script setup lang="ts">
import { Scorm12API } from 'scorm-again';
import { nextTick, onMounted, ref } from 'vue';

const isLoading = ref(false);

const initScorm = async () => {
  const settings = {
    logLevel: 1,
    autocommit: true,
  };

  // const scormVersion = 'API';

  try {
    await new Promise(() => {
      // @ts-ignore
      window.API = new Scorm12API(settings);

      // @ts-ignore
      window.API.cmi.core.student_id = '43';
      // @ts-ignore
      window.API.cmi.core.student_name = 'pos pos';
      // @ts-ignore
      window.API.cmi.core.credit = 'credit';
      // @ts-ignore
      window.API.cmi.core.entry = 'ab-initio';

      // @ts-ignore
      window.API.cmi.core.lesson_status = 'incomplete';
      // @ts-ignore
      window.API.cmi.suspend_data = ''; //scormData.suspend_data ? atob(scormData.suspend_data) : "";

      // @ts-ignore
      console.log('Итоговая модель CMI перед запуском курса:', window.API.cmi);
    });
  } catch (error) {}
};

onMounted(async () => {
  isLoading.value = true;

  try {
    initScorm();
  } catch (error) {
    console.log(error);
  }
  isLoading.value = false;
});

console.log(window);
</script>

<template>
  <div
    v-if="!isLoading"
    id="scorm-wrapper"
    style="width: 100%; height: 600px; border: 1px solid #ddd; border-radius: 4px">
    <iframe
      src="https://sa.eu.brusnika-apps.com//local/scorm/artur.yakhin52@gmail.com/9738/index.html"
      frameborder="0"
      allowfullscreen
      width="100%"
      height="100%"
      title="SCORM контент"></iframe>
  </div>
  <div v-else>loading</div>
</template>

<style scoped></style>
